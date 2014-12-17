using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Zusammenfassungsbeschreibung für Game
/// </summary>
/// 

public partial class dbGame
{
    // Konstanten: die Cashflows, z.B. +30, -5, +10, 0
    public int cfCC { get; set; }
    public int cfDog { get; set; }
    public int cfStar { get; set; }
    public int cfQM { get; set; }

    // Legt die Sieg-Bedingungen fest (bei Szenarien bei denen z.B. "2CCs am Ende" stehen soll)
    public bool endStateBasedOnConstellation { get; set; }
    public int endStateCC { get; set; }
    public int endStateDog { get; set; }
    public int endStateStar { get; set; }
    public int endStateQM { get; set; }

    public string ceo_advisor_name {get;set;}
    public string ceo_advisor_imagesource { get; set; }
    public string ceo_advisor_feedback { get; set; }
    public string ceo_advisor_enabled { get; set; }

    public Array endConditions { get; set; }

    //public string extravariable { get; set; }
    public void createAGame()
    { 
        //dbMarket.Add(
    }
}

[Serializable]
public partial class dbMarket
{    
    public void createAMarket()  //this just in so that I can add the Serializable-decoration
    { 
        
    }
}

[Serializable]
public partial class dbProduct
{
    public int winningTotalCFForThisProduct_optimal { get; set; }
    public int winningTotalCFForThisProduct_minimal { get; set; }
    public void createAProduct()
    { 
    
    }
}
[Serializable]
public partial class dbProductState
{
    public void createSomeProductStates()
    {
        turn = 0;
        marketshare = 0.8;
    }
}
