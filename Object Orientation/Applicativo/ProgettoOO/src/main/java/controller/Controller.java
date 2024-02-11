package controller;

/**
 * TYPE : class - controller package
 * NAME : Controller
 *
 * DESC: TODO
 */
public class Controller
{
  private static Controller controllerInstance = null;

	private Controller()
	{
	}

	public static Controller getControllerInstance()
	{
		if (null == controllerInstance)
		{
			controllerInstance = new Controller();
		}

		return controllerInstance;
	}
}
