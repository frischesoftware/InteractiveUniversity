using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;


public partial class dbKanbanGame
{
    public dbKanbanGame()
    {
        this.dbKanbanElement = new HashSet<dbKanbanElement>();
    }

    public int id { get; set; }
    public string playergamename { get; set; }
    public Nullable<int> turnbookmark { get; set; }
    public string gamename { get; set; }

    public virtual ICollection<dbKanbanElement> dbKanbanElement { get; set; }

    public virtual ICollection<dbKanbanProduct> dbKanbanProduct { get; set; }

    public void Initialize(string gameName)
    {
        this.playergamename = "KanBanMan";
        this.gamename = "Basic";
        this.turnbookmark = 0;

        
        Collection<dbKanbanElement> elements = new Collection<dbKanbanElement>();
        dbKanbanElement ke = new dbKanbanElement();
        ke.Initialize();
        elements.Add(ke);

        foreach (var element  in elements)
        {
            this.dbKanbanElement.Add(element);   
        }
         
        //Collection<dbKanbanProduct> products = new Collection<dbKanbanProduct>();
        //dbKanbanProduct kp = new dbKanbanProduct("prod1");
        //products.Add(kp);
                
        //foreach (var _kp in products)
        //{
        //    this.dbKanbanProduct.Add(_kp);        
        //}
        
    }
    
}


// Kanbanelemente (Shapes) unabhängig von dem KanbanProduct
public partial class dbKanbanElement
{
    public int id { get; set; }
    public string ElementName { get; set; }
    public string element_visualization { get; set; }
    public virtual dbKanbanGame dbKanbanGame { get; set; }

    public void Initialize()
    {
        this.ElementName = "the name"; 
        List<object> e = new List<object>();
        e.Add(new dbFFSvgElementShapeRECT("1", 800, 500, "#ccc", 10, 10));
        //e.Add(new dbFFSvgElementShapeCIRCLE("1", 20, "green", 40, 40, "a"));
        //e.Add(new dbFFSvgElementShapeCIRCLE("1", 20, "blue", 40, 90, "b"));
        
        e.Add(new dbKANBANSvgMAP(e, 2));  // Anzahl Stages
        

        JavaScriptSerializer js = new JavaScriptSerializer();
        this.element_visualization = js.Serialize(e);
    }
}

