package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class AdminTopViewTeam
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;
	public AdminTopViewTeam(String teamID, String teamType, JPanel rootPanel)
	{
		MigLayout migLayout;
		JPanel panel;
		JButton updateGeneralInformationButton;
		JButton addParticipationButton;
		JButton deleteParticipationButton;
		JButton addTrophyButton;
		JButton deleteTrophyButton;
		JButton addPrizeButton;
		JButton deletePrizeButton;
		JButton deleteTeamButton;

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
						GuiConfiguration.WRAP_4_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);

		this.add(panel);

		updateGeneralInformationButton = new JButton(GuiConfiguration.getMessage("editGeneralInfo"));
		updateGeneralInformationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		updateGeneralInformationButton.setEnabled(teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString()));
		panel.add(updateGeneralInformationButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addParticipationButton = new JButton(GuiConfiguration.getMessage("addParticipation"));
		addParticipationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addParticipationButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addTrophyButton = new JButton(GuiConfiguration.getMessage("addTrophy"));
		addTrophyButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addTrophyButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		addPrizeButton = new JButton(GuiConfiguration.getMessage("addPrize"));
		addPrizeButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addPrizeButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteTeamButton = new JButton(GuiConfiguration.getMessage("delTeam"));
		deleteTeamButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteTeamButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteParticipationButton = new JButton(GuiConfiguration.getMessage("delParticipation"));
		deleteParticipationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteParticipationButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteTrophyButton = new JButton(GuiConfiguration.getMessage("delTrophy"));
		deleteTrophyButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteTrophyButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePrizeButton = new JButton(GuiConfiguration.getMessage("delPrize"));
		deletePrizeButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePrizeButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		updateGeneralInformationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamUpdateGeneralInfo(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});


		addParticipationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamAddParticipation(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		addTrophyButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamAddTrophy(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		addPrizeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamAddPrize(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deleteTeamButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, GuiConfiguration.getMessage("msgDelete"));

				String message = Controller.getInstance().deleteTeam(teamID);

				System.out.println(message);

				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new CreateTeam()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		deleteParticipationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelParticipation(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deleteTrophyButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelTrophy(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		deletePrizeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try {
					rootPanel.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelPrize(teamID, teamType)),
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
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
	}
}
