using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbKanbanProduct
/// </summary>
public class dbKanbanProduct
{
    public int id { get; set; }
    public string name { get; set; }

    //public List<object> elements { get; set; }

    //public virtual ICollection<dbKanbanProductStage> dbKanbanProductStage { get; set; }


    public dbKanbanProduct(string _name)
    {
        this.name = _name;
        //this.dbKanbanProductStage = new HashSet<dbKanbanProductStage>();

    }
    
}

public class dbKanbanProductStage // 1 Product wird gebaut auf 1..n Stages (Maschinen nacheinander)
{ 
        

    public int id  {get;set;}
    public string name {get;set;}
    public virtual ICollection<dbKanbanProductStagePart> dbKanbanProductStagePart { get; set; }
    public virtual ICollection<dbKanbanProductStageShelf> dbKanbanProductStageShelf { get; set; }

    public dbKanbanProductStage(string _name)
    {
        this.name = _name;
        this.dbKanbanProductStagePart = new HashSet<dbKanbanProductStagePart>();
        this.dbKanbanProductStageShelf = new HashSet<dbKanbanProductStageShelf>();
    }

    public virtual dbKanbanProduct dbKanbanProduct { get; set; }

}

public partial class dbKanbanProductStagePart  // 1 Stage - n Parts
{
    public int id { get; set; }
    public string name { get; set; }
    public virtual dbKanbanProductStage dbKanbanProductStage { get; set; }

}


public partial class dbKanbanProductStageShelf // 1 Stage - n Shelves
{
    public int id { get; set; }
    public string name { get; set; }
    public List<object> elements {get;set;}

    public dbKanbanProductStageShelf()
    {
        elements = new List<object>();
     

    }

    public virtual dbKanbanProductStage dbKanbanProductStage { get; set; }

    
    
       

}