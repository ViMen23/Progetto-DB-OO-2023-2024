package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class AdminTopViewTeam
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;
	public AdminTopViewTeam(String teamID, String teamType)
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
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						null
		);
		setLayout(migLayout);


		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout(
						"debug, wrap 4", //TODO
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


		addPrizeButton = new JButton("INSERISCI PREMI"); //TODO
		addPrizeButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(addPrizeButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteTeamButton = new JButton(GuiConfiguration.getMessage("delTeam")); //TODO
		deleteTeamButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteTeamButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteParticipationButton = new JButton(GuiConfiguration.getMessage("delParticipation"));
		deleteParticipationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteParticipationButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteTrophyButton = new JButton(GuiConfiguration.getMessage("delTrophy"));
		deleteTrophyButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteTrophyButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deletePrizeButton = new JButton("ELIMINA PREMI"); //TODO
		deletePrizeButton.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deletePrizeButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		updateGeneralInformationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewGeneralInfo(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});


		addParticipationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewAddParticipation(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		addTrophyButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewAddTrophy(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		addPrizeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				//container.add(new AdminViewAddPrize(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		deleteTeamButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, GuiConfiguration.getMessage("msgDelete"));

				String message = Controller.getInstance().deleteTeam(teamID);

				System.out.println(message);

				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewDelParticipation(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});
		deleteParticipationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewDelParticipation(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		deleteTrophyButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewDelTrophy(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		deletePrizeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				//container.add(new AdminViewDelPrize(teamID, teamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});
	}
	public void setGeneralInfoPanel(Map<String,String> infoTeamMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
	}
}
