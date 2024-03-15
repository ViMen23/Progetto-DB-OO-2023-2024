package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

/**
 * Questa classe fornisce una vista agli amministratori per visualizzare le informazioni sulle competizioni
 * e gestire le edizioni di una competizione specifica.
 */
public class AdminTopViewCompetition
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;

	/**
	 * Costruttore della classe.
	 *
	 * @param competitionID Identificativo della competizione.
	 * @param competitionTeamType Tipo di squadra (Nazionale o Club) della competizione.
	 * @param parentPanel Pannello padre nella gerarchia dell'interfaccia.
	 */
	public AdminTopViewCompetition(String competitionID,
																 String competitionTeamType,
																 JPanel parentPanel)
	{
		MigLayout migLayout;
		JPanel panel;
		JMenuBar menuBar;
		JMenu menu;
		JMenuItem menuItem;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						null
		);
		this.setLayout(migLayout);


		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						null,
						null
		);

		panel = new JPanel(migLayout);
		this.add(panel);
		/*------------------------------------------------------------------------------------------------------*/
		menuBar = new JMenuBar();

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_50_LAYOUT_CONSTRAINT,
						null
		);

		menuBar.setLayout(migLayout);
		panel.add(menuBar);
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("competitionEditions"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addCompetitionEdition"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewCompetitionAddCompetitionEdition(competitionID, competitionTeamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("delCompetitionEdition"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewCompetitionDelCompetitionEdition(competitionID, competitionTeamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}

	/**
	 * Imposta le informazioni generali sulla competizione nel pannello dedicato.
	 *
	 * @param infoCompetitionMap Mappa contenente le informazioni sulla competizione.
	 */
	public void setGeneralInfoPanel(Map<String,String> infoCompetitionMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoCompetitionMap, "competitionInformation");
	}
}
