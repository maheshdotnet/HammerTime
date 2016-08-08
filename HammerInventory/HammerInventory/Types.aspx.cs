using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HammerInventory
{
    public partial class Types : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        
        private void BindGrid()
        {
            using (HammerDBEntities entities = new HammerDBEntities())
            {                
                var data = entities.HammerTypes.Select(p => p);

                if (data.Count() == 0)
                {
                    HammerType objType = new HammerType();
                    grdHammerTypes.DataSource = new object[0];
                }
                else
                    grdHammerTypes.DataSource = data.ToList();

                grdHammerTypes.DataBind();
            }
        }

        
        protected void Insert()
        {
            string result = "";
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                ObjectResult<string> objOutput = entities.InsertUpdateHammerType(0, txtHammerType.Text, txtDesc.Text, "SYSTEM");
                result = objOutput.FirstOrDefault();
                entities.SaveChanges();
            }

            if (result == "Success")
            {
                lblError.Text = string.Empty;
                mpHammerType.Hide();
                this.BindGrid();
            }
            else
            {
                lblError.Text = result;
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            hdnTypeId.Value= grdHammerTypes.DataKeys[e.NewEditIndex].Values[0].ToString();
            GridViewRow row = grdHammerTypes.Rows[e.NewEditIndex];
            txtHammerType.Text = (row.FindControl("lblName") as Label).Text;
            txtDesc.Text = (row.FindControl("lblDesc") as Label).Text;
            btnSave.Text = "Update";
            lblError.Text = string.Empty;
            mpHammerType.Show();
            e.Cancel = true;
        }

        protected void Update()
        {
            int typeId = Convert.ToInt32(hdnTypeId.Value);
            string result = "";
            using (HammerDBEntities entities = new HammerDBEntities())
            {
                ObjectResult<string> objOutput= entities.InsertUpdateHammerType(typeId, txtHammerType.Text, txtDesc.Text, "SYSTEM");
                result = objOutput.FirstOrDefault();
                entities.SaveChanges();
            }

            if (result == "Success")
            {
                lblError.Text = string.Empty;
                grdHammerTypes.EditIndex = -1;
                mpHammerType.Hide();
                this.BindGrid();
            }
            else
            {
                lblError.Text = result;
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grdHammerTypes.EditIndex)
            {
                ImageButton btnEdit = (e.Row.Cells[2].Controls[0] as ImageButton);
                btnEdit.CssClass = "GridButtons";
                ImageButton btnDelete = (e.Row.Cells[2].Controls[2] as ImageButton);
                btnDelete.CssClass = "GridButtons";
                btnDelete.OnClientClick = "if(!confirm('Are you sure you want to delete this type?')) return;";
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHammerTypes.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int typeId = Convert.ToInt32(grdHammerTypes.DataKeys[e.RowIndex].Values[0]);

            using (HammerDBEntities entities = new HammerDBEntities())
            {
                entities.DeleteHammerType(typeId);
                entities.SaveChanges();
            }
            this.BindGrid();
        }

        protected void lbtnAddNew_Click(object s, EventArgs e)
        {
            txtHammerType.Text = txtDesc.Text = string.Empty;
            btnSave.Text = "Save";
            lblError.Text = string.Empty;
            mpHammerType.Show();
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