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

		ViewCompetitionPanel viewCompetitionPanel = new ViewCompetitionPanel();

		//searchPlayerPanel.setName("searchPlayerPanel");

		viewCompetitionPanel.setName("boh");

		MainFrame.getMainFrameInstance().add(viewCompetitionPanel);
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
