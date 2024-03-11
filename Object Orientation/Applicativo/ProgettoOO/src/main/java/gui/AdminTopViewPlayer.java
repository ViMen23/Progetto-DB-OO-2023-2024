package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class AdminTopViewPlayer
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;
	public AdminTopViewPlayer(String playerID, JPanel rootPanel)
	{
		MigLayout migLayout;
		JPanel panel;
		JButton updateGeneralInformationButton;
		JButton addPlayerPosition;
		JButton addNationality;
		JButton addPlayerTag;
		JButton addMilitancy;
		JButton addTrophy;
		JButton addPrize;
		JButton updateAttribute;
		JButton updateStatistic;
		JButton deletePlayer;
		JButton deletePlayerPosition;
		JButton deleteNationality;
		JButton deletePlayerTag;
		JButton deleteMilitancy;
		JButton deleteTrophy;
		JButton deletePrize;


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
						"debug, wrap 4",
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);

		this.add(panel);

		updateGeneralInformationButton = new JButton(GuiConfiguration.getMessage("editGeneralInfo"));
		updateGeneralInformationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(updateGeneralInformationButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addPlayerPosition = new JButton(GuiConfiguration.getMessage("addPlayerPosition"));
		addPlayerPosition.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addPlayerPosition, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addNationality = new JButton(GuiConfiguration.getMessage("addNationality"));
		addNationality.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addNationality, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addPlayerTag = new JButton(GuiConfiguration.getMessage("addPlayerTag"));
		addPlayerTag.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addPlayerTag, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addMilitancy = new JButton(GuiConfiguration.getMessage("addMilitancy"));
		addMilitancy.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addMilitancy, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addTrophy = new JButton(GuiConfiguration.getMessage("addTrophy"));
		addTrophy.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addTrophy, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addPrize = new JButton(GuiConfiguration.getMessage("addPrize"));
		addPrize.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addPrize, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		updateAttribute = new JButton(GuiConfiguration.getMessage("updateAttribute"));
		updateAttribute.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(updateAttribute, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		updateStatistic = new JButton(GuiConfiguration.getMessage("updateStatistic"));
		updateStatistic.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(updateStatistic, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePlayer = new JButton(GuiConfiguration.getMessage("delPlayer"));
		deletePlayer.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePlayer, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePlayerPosition = new JButton(GuiConfiguration.getMessage("delPlayerPosition"));
		deletePlayerPosition.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePlayerPosition, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteNationality = new JButton(GuiConfiguration.getMessage("delNationality"));
		deleteNationality.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteNationality, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePlayerTag = new JButton(GuiConfiguration.getMessage("delPlayerTag"));
		deletePlayerTag.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePlayerTag, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteMilitancy = new JButton(GuiConfiguration.getMessage("delMilitancy"));
		deleteMilitancy.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteMilitancy, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteTrophy = new JButton(GuiConfiguration.getMessage("delTrophy"));
		deleteTrophy.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteTrophy, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePrize = new JButton(GuiConfiguration.getMessage("delPrize"));
		deletePrize.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePrize, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		updateGeneralInformationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateGeneralInfo(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});



		addPlayerPosition.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddPosition(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		addNationality.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddNationality(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		addPlayerTag.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddTag(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		addMilitancy.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		addTrophy.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		addPrize.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddPrize(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		updateAttribute.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

//					MainFrame.getMainFrameInstance().getContentPane().add(
//									new AdminNavigationPanel(new AdminViewPlayerUpdateAttribute(playerID)),
//									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
//					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		updateStatistic.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateStatistic(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deletePlayer.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, GuiConfiguration.getMessage("msgDelete"));

				//String message = Controller.getInstance().deleteTeam(teamID);

				//System.out.println(message);

				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new CreatePlayer()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deletePlayerPosition.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelPosition(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deleteNationality.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelNationality(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deletePlayerTag.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelTag(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deleteMilitancy.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		deleteTrophy.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		deletePrize.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelPrize(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
	}
	public void setGeneralInfoPanel(Map<String,String> infoTeamMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "playerInformation");
	}
}
