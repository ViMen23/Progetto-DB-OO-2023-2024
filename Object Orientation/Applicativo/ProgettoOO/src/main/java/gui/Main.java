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

		SearchTeamPanel searchTeamPanel = new SearchTeamPanel();

		//searchPlayerPanel.setName("searchPlayerPanel");

		searchTeamPanel.setName("searchTeamPanel");

		MainFrame.getMainFrameInstance().add(searchTeamPanel);
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
