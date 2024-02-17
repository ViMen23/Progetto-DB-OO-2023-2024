package controller;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller {
	private static Controller controllerInstance = null;

	private Controller() {
	}

	public static Controller getControllerInstance() {
		if (null == controllerInstance) {
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}

	public JComponent getDestComp(JComponent component, String nameDestination)
	{

		Integer step = stepToCommonContainer(component.getName().split("\\+"),
			nameDestination.split("\\+"));

		Container container = getAncestor(component, step);

		for (Component aComponent : container.getComponents()) {

			if (aComponent.getName().equalsIgnoreCase(nameDestination)) {
				return (JComponent) aComponent;
			}
		}

		System.err.println("Errore i due componenti non hanno contenitori in comune");
		return null;
	}



	public Integer stepToCommonContainer(String[] splitSource, String[] splitDestination)
	{
		for (int i = 0; i < splitDestination.length; ++i) {
			if(!splitSource[i].equalsIgnoreCase(splitDestination[i])) {
				return splitDestination.length - i;
			}
		}
		System.err.println("Errore posizione di un container comune non trovata");
		return -1;
	}

	public Container getAncestor(JComponent component, Integer step)
	{
		Container container = null;

		for(int i= 0; i < step; ++i){
			container = component.getParent();
		}

		if( container == null){
			System.err.println("Errore nel prendere il container");
		}

		return container;

	}
}
