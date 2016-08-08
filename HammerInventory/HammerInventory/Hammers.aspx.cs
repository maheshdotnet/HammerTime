using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HammerInventory
{
    public partial class Hammers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
                this.BindDropDown();
            }
        }
        
        private void BindGrid()
        {
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                grdHammers.DataSource = entities.GetHammers();
                grdHammers.DataBind();
            }
        }

        private void BindDropDown()
        {
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                var data = entities.HammerTypes.Select(p => p);

                if (data.Count() == 0)
                {
                    HammerType objType = new HammerType();
                    ddlTypes.DataSource = new object[0];
                }
                else
                    ddlTypes.DataSource = data.ToList();

                ddlTypes.DataBind();
                ddlTypes.Items.Insert(0, new ListItem("Select"));
            }
        }

        protected void Insert()
        {
            string result = "";
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                ObjectResult<string> objOutput = entities.InsertUpdateHammer(0, txtHammer.Text, txtDesc.Text,Convert.ToInt32(ddlTypes.SelectedValue), "SYSTEM");
                result = objOutput.FirstOrDefault();
                entities.SaveChanges();
            }

            if (result == "Success")
            {
                lblError.Text = string.Empty;
                mpHammer.Hide();
                this.BindGrid();
            }
            else
                lblError.Text = result;
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            hdnHammerId.Value = grdHammers.DataKeys[e.NewEditIndex].Values[0].ToString();
            string typeId = grdHammers.DataKeys[e.NewEditIndex].Values[1].ToString();
            GridViewRow row = grdHammers.Rows[e.NewEditIndex];
            txtHammer.Text = (row.FindControl("lblName") as Label).Text;
            txtDesc.Text = (row.FindControl("lblDesc") as Label).Text;
            ddlTypes.SelectedValue = typeId;
            btnSave.Text = "Update";
            lblError.Text = string.Empty;
            mpHammer.Show();
            e.Cancel = true;
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHammers.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Update()
        {
            int hammerId = Convert.ToInt32(hdnHammerId.Value);
            string result = "";
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                ObjectResult<string> objOutput = entities.InsertUpdateHammer(hammerId, txtHammer.Text, txtDesc.Text, Convert.ToInt32(ddlTypes.SelectedValue), "SYSTEM");
                result = objOutput.FirstOrDefault();
                entities.SaveChanges();
            }

            if (result == "Success")
            {
                lblError.Text = string.Empty;
                grdHammers.EditIndex = -1;
                mpHammer.Hide();
                this.BindGrid();
            }
            else
                lblError.Text = result;
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grdHammers.EditIndex)
            {
                ImageButton btnEdit = (e.Row.Cells[3].Controls[0] as ImageButton);
                btnEdit.CssClass = "GridButtons";
                ImageButton btnDelete = (e.Row.Cells[3].Controls[2] as ImageButton);
                btnDelete.CssClass = "GridButtons";
                btnDelete.OnClientClick = "if(!confirm('Are you sure you want to delete this hammer?')) return;";
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int hammerId = Convert.ToInt32(grdHammers.DataKeys[e.RowIndex].Values[0]);

            using (HammerDBEntities entities = new HammerDBEntities())
            {
                entities.DeleteHammer(hammerId);
                entities.SaveChanges();
            }
            this.BindGrid();
        }

        protected void lbtnAddNew_Click(object s, EventArgs e)
        {
            txtHammer.Text = txtDesc.Text = string.Empty;
            ddlTypes.SelectedIndex = -1;            
            btnSave.Text = "Save";
            lblError.Text = string.Empty;
            mpHammer.Show();
        }

        protected void btnSave_Click(object s, EventArgs e)
        {
            if (btnSave.Text == "Save")
                Insert();
            else
                Update();
        }
    }
}