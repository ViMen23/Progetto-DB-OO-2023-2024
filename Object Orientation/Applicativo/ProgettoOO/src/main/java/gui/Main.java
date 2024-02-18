package gui;

/**
 * TYPE : class - gui package
 * NAME : Main
 *
 * DESC: TODO
 */
public class Main
{
	private static void createAndShowGUI()
	{
		GuiConfiguration.initGuiConfiguration();

		SearchPlayerPanel searchPlayerPanel = new SearchPlayerPanel();
		searchPlayerPanel.setName("searchPlayerPanel");
		MainFrame.getMainFrameInstance().add(searchPlayerPanel, "center, wrap");

		MainFrame.getMainFrameInstance().pack();

	}


	public static void main(String[] args)
  {
		// Pianifica un lavoro per la creazione e la visualizzazione della GUI di questa applicazione.
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
				public void run()
				{
					createAndShowGUI();
				}
		});
  }

}
