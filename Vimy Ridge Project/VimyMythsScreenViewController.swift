//
//  VimyMythsScreenViewController.swift
//  Vimy Ridge Project
//
//  Created by Student on 2016-12-14.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class VimyMythsScreenViewController: UIViewController {
    
    
    @IBOutlet weak var mythName: UILabel!
    
    @IBOutlet weak var mythExplanation: UILabel!
    
    @IBOutlet weak var mythTextScroll: UIScrollView!
    
    
    override func viewDidLoad () {
        
        super.viewDidLoad()
        
        if (mythVariables.infoShown == 1) {
            self.mythName.text = "The Vimy monument is not just for the soldiers that died during the Battle of Vimy Ridge."
            
            self.mythExplanation.text = "There is a growing misunderstanding that surrounds the original intent of the Vimy monument as designed by Walter Allward.  The monument was built by Allward as a tribute to the Canadians that fought in the Great War and in particular to those that gave their lives.  At the base of the monument are the names of Canadian soldiers that were killed on the soil of France but have no known grave.  The Monument’s secondary purpose was to commemorate the battle for Vimy Ridge as one of eight significant Canadian engagements in Belgium and France."
        }
            
        else if (mythVariables.infoShown == 2) {
            self.mythName.text = "Canada was the only country to succeed in taking Vimy Ridge (France and Britain did not actually fail)."
            
            self.mythExplanation.text = "One of the controversies surrounding the engagement at Vimy Ridge is the belief that Canada succeeded in taking the ridge when all other countries failed.  The controversy is that Canadian soldiers were the sole actors in the Vimy Sector when it was an international effort.  In part, the success of the Canadian advance was due to British artillery that worked to neutralize the German guns.  As well, the Canadians were working in unison with the British XVII Corps as part of the overall plan.  Another factor to consider was that the French army remember the Lorette Spur and Vimy Ridge as one of the key places where they brought the 1914 German invasion to a halt.  Their 1915 desperate and costly attempt to re-capture Vimy Ridge was partially successful, securing the foothold from which the Canadians would attack from in 1917. As for the British, they shifted to the Vimy sector in 1916 and never attacked Vimy Ridge."
        }
            
        else if (mythVariables.infoShown == 3) {
            self.mythName.text = "The Battle of Vimy Ridge marked the first time all Canadian divisions fought together. (The Battle of Mount Sorrel was the actual first time all active Canadian divisions fought together)."
            
            self.mythExplanation.text = "Much is made in Canada’s history about the Canadian army’s four divisions fighting together for the first time in the Great War.  To make this true the argument is that it is the first time that the four divisions fought together side-by-side in a composite formation.  The 4th Canadian Division was formed in April 1916 and was put into action in November 1916 at Regina Trench at the Somme.  The 4th Canadian Division would return at the Battle of Vimy Ridge along with Canada’s three other divisions but a 5th Canadian Division had been formed in England in February 1917 but would never see action.  The 5th Canadian Division would be broken up and the soldiers absorbed by the other four divisions.  If Canadians disregard that all four divisions fought on the Somme or that a 5th Division existed in England than it is true that all four divisions fought side-by-side for the first time at the Battle of Vimy Ridge."
        }
            
        else if (mythVariables.infoShown == 4) {
            self.mythName.text = "Canada commanded themselves (Canada was actually under the command of the British (Julian Byng)."
            
            self.mythExplanation.text = "There is great confusion about who commanded the Canadian Expeditionary Force at the Battle of Vimy Ridge.  The Canadian Corps commander at the time of the Vimy Battle was Sir Julian Byng.  Byng, who later became the Governor General of Canada (1921-26), was born British.  Byng had commanded British troops at Vimy for much of 1916 and had considerable knowledge of the defences there.  At the time of the Battle of Vimy Ridge there were three Canadian-born Division commanders:  Arthur Currie (1st Division), Henry Burstall (2nd Division) and David Watson (4th Division).  Louis Lipsett (3rd Division) was born in Ireland."
        }
            
        else if (mythVariables.infoShown == 5) {
            self.mythName.text = "It brought together a nation and created the Canadian Identity. “We went up the hill as individuals….”"
            
            self.mythExplanation.text = "There is some controversy surrounding the legitimacy of suggesting that Canada became a nation at the Battle of Vimy Ridge.  This can be viewed as somewhat controversial if Canadians accept that our nation was born on a battlefield or that Canadians accept that French-Canada or Indigenous populations might disagree.  Also, the significant loses at Vimy contributed to the Conscription Crisis and the violent divide between Francophone and Anglophone Canada threatening the cohesion of Canada.  There is considerable weight given to Canada’s position at the table for the signing of the Treaty of Versailles (1919) or the granting of Canadian representatives at the Statute of Westminster (1931) connected to Canada’s success at the Battle of Vimy Ridge.  The cause and effect of Vimy Ridge on these two events is a matter of debate by historians."
        }
            
        else if (mythVariables.infoShown == 6) {
            self.mythName.text = "Not really a myth but, Canadians see it as the Battle of Vimy Ridge while the rest of the World calls it the Battle of Arras."
            
            self.mythExplanation.text = "The Canadian Expeditionary Force (CEF) was a part of the larger British Expeditionary Force (BEF) throughout the Great War.  Specifically, while many Canadians view the Battle of Vimy Ridge (9-12 April 1917) as an independent battle won by Canadians.  The four Canadian divisions fighting in the seven kilometer Vimy Sector which was part of a much larger twenty-seven division front known as part of the British and Dominion Battle of Arras, in turn a part of the wider Allied Nivelle Offensive including French forces."
        }
            
        else {
            self.mythName.text = "The Vimy monument is not just for the soldiers that died during the Battle of Vimy Ridge."
            
            self.mythExplanation.text = "There is a growing misunderstanding that surrounds the original intent of the Vimy monument as designed by Walter Allward.  The monument was built by Allward as a tribute to the Canadians that fought in the Great War and in particular to those that gave their lives.  At the base of the monument are the names of Canadian soldiers that were killed on the soil of France but have no known grave.  The Monument’s secondary purpose was to commemorate the battle for Vimy Ridge as one of eight significant Canadian engagements in Belgium and France."
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
