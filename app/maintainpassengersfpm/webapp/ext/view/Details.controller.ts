import Controller from "sap/fe/core/PageController";
import Table from "sap/fe/macros/table/TableAPI";
import { Button$PressEvent } from "sap/m/Button";
import Event from "sap/ui/base/Event";
import Core from "sap/ui/core/Core";
import Context from "sap/ui/model/odata/v4/Context";

/**
 * @namespace com.fe.fpm.maintainpassengersfpm.ext.view.Details.controller
 */
export default class Details extends Controller {

    /**
     * Called when a controller is instantiated and its View controls (if available) are already created.
     * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
     * @memberOf com.fe.fpm.maintainpassengersfpm.ext.view.Details
     */
    // public onInit(): void {
    //
    //}

    /**
     * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
     * (NOT before the first rendering! onInit() is used for that one!).
     * @memberOf com.fe.fpm.maintainpassengersfpm.ext.view.Details
     */
    // public  onBeforeRendering(): void {
    //
    //  }

    /**
     * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
     * This hook is the same one that SAPUI5 controls get after being rendered.
     * @memberOf com.fe.fpm.maintainpassengersfpm.ext.view.Details
     */
    // public  onAfterRendering(): void {
    //
    //  }

    /**
     * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
     * @memberOf com.fe.fpm.maintainpassengersfpm.ext.view.Details
     */
    // public onExit(): void {
    //
    //  },

    refreshTable() {
        let table = Core.byId("maintainpassengersfpm::PassengerMain--table") as Table;
        table.refresh();
    }

    async onEditPress(oEvent: Button$PressEvent) {
        let context = this.getView()?.getBindingContext() as Context;
        let isActiveEntity = await context.requestProperty("IsActiveEntity");
        if(isActiveEntity) {
            await this.getExtensionAPI().getEditFlow().editDocument(context);
        } else {
            // await this.getExtensionAPI().getEditFlow().editDocument(context);
        }
    }

    async onCancelPress(event: Event) {
        debugger;
        let context = this.getView()?.getBindingContext() as Context;
        let activeEntity = await context.requestProperty("HasActiveEntity");
        this.getExtensionAPI().getEditFlow().cancelDocument(context, { control: event.getSource()})   
        if(activeEntity) {
            this.getExtensionAPI().getRouting().navigateToRoute("/");
        }
    }
}