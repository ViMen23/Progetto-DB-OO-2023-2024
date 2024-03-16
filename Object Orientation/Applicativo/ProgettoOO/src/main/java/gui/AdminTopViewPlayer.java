package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

/**
 * Classe che rappresenta la vista principale per la gestione di un giocatore da parte dell'amministratore.
 */
public class AdminTopViewPlayer
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;

	public AdminTopViewPlayer(String playerID, JPanel parentPanel)
	{
		MigLayout migLayout;
		JPanel panel;
		JMenuBar menuBar;
		JMenu menu;
		JMenu subMenu;
		JMenuItem menuItem;
		JButton button;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
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

		menu = new JMenu(GuiConfiguration.getMessage("generalInfo"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateGeneralInfo"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateGeneralInfo(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateRetiredDate"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateRetiredDate(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("positions"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addPlayerPosition"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddPosition(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("delPlayerPosition"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelPosition(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("nationalities"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addNationality"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddNationality(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delNationality"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelNationality(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("tag").toUpperCase());
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("addPlayerTag"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddTag(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delPlayerTag"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelTag(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		menu = new JMenu(GuiConfiguration.getMessage("career"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		subMenu = new JMenu(GuiConfiguration.getMessage("clubCareer"));
		subMenu.setFont(GuiConfiguration.outputSmallFont);
		subMenu.setForeground(Color.black);

		subMenu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		subMenu.getPopupMenu().setLayout(migLayout);
		menu.add(subMenu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("addClubMilitancy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddClubMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delClubMilitancy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelClubMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		subMenu = new JMenu(GuiConfiguration.getMessage("nationalCareer"));

		subMenu.setCursor(GuiConfiguration.HAND_CURSOR);
		subMenu.setFont(GuiConfiguration.outputSmallFont);
		subMenu.setForeground(Color.black);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		subMenu.getPopupMenu().setLayout(migLayout);
		menu.add(subMenu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("addNationalMilitancy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddNationalMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delNationalMilitancy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelNationalMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("trophies"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		subMenu = new JMenu(GuiConfiguration.getMessage("clubTrophies"));
		subMenu.setFont(GuiConfiguration.outputSmallFont);
		subMenu.setForeground(Color.black);

		subMenu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		subMenu.getPopupMenu().setLayout(migLayout);
		menu.add(subMenu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("addClubTrophy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddClubTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delClubTrophy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelClubTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		subMenu = new JMenu(GuiConfiguration.getMessage("nationalTrophies"));

		subMenu.setCursor(GuiConfiguration.HAND_CURSOR);
		subMenu.setFont(GuiConfiguration.outputSmallFont);
		subMenu.setForeground(Color.black);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		subMenu.getPopupMenu().setLayout(migLayout);
		menu.add(subMenu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("addNationalTrophy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddNationalTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delNationalTrophy"));
		subMenu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelNationalTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("prizes"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("addPrize"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddPrize(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("delPrize"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelPrize(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("attributes").toUpperCase());
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateGoalkeepingAttribute"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateGoalkeepingAttribute(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
		
		
		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateMentalAttribute"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateMentalAttribute(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("updatePhysicalAttribute"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdatePhysicalAttribute(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateTechnicalAttribute"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateTechnicalAttribute(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		menu = new JMenu(GuiConfiguration.getMessage("statistics"));
		menu.setCursor(GuiConfiguration.HAND_CURSOR);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						null,
						null
		);

		menu.getPopupMenu().setLayout(migLayout);
		menuBar.add(menu);
		/*------------------------------------------------------------------------------------------------------*/

		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateClubStatistics"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateClubStatistic(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		menuItem = new JMenuItem(GuiConfiguration.getMessage("updateNationalStatistics"));
		menu.getPopupMenu().add(menuItem);

		menuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateNationalStatistic(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.BIN_ICON);
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		panel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgConfirmDelete"),
								GuiConfiguration.getMessage("deletePlayer"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message = Controller.getInstance().deletePlayer(playerID);

					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
				}

				try {
					parentPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(parentPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new JPanel()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
	}

	public void setGeneralInfoPanel(Map<String,String> infoPlayerMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoPlayerMap, "playerInformation");
	}
}
