<aura:application controller="MapIterationController" extends="force:slds">
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <aura:attribute name="oppAccountList" type="List" />
    
    <div class="slds-m-around_small">
        <div class="slds-page-header">
            <div class="slds-media">
                <div class="slds-media__body">
                    <div class="slds-box slds-theme_shade">
                        <p> <h1>Map Iteration in Lightning Component</h1></p>
                    </div>
                    <br/><br/>
                    <p class="slds-text-body_small slds-line-height_reset">
                        <div class="slds-table--header-fixed_container">
                            <div class="slds-scrollable_y" >
                                <table class="slds-table slds-table_bordered slds-table_cell-buffer slds-table_col-bordered slds-table_striped">
                                    <thead>
                                        <tr class="slds-text-title_caps">
                                            
                                            <th scope="col">
                                                <div title="Key">Key</div>
                                            </th>
                                            <th scope="col">
                                                <div title="Value">Value</div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <aura:iteration items="{!v.oppAccountList}" var="opp" indexVar="key">
                                        <tr>
                                            
                                                <th scope="col">
                                                    <div title="{!opp.key}">{!opp.key}</div>
                                                </th>
                                                <th scope="col">
                                                    <div title="{!opp.value}">{!opp.value}</div>
                                                </th>
                                            
                                        </tr>
                                            </aura:iteration>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </p>
                </div>
            </div><br/>
        </div><br/>
    </div>
    
</aura:application>