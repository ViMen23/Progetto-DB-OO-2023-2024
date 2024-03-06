package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class TopViewPlayerPanel
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;

	public TopViewPlayerPanel(String playerID)
	{
		MigLayout migLayout;
		JPanel navigationPanel;
		JButton generalInfoButton;
		JButton detailedInfoButton;
		JButton careerButton;
		JButton clubStatisticsButton;
		JButton nationalStatisticsButton;
		JButton caseButton;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT
		);
		setLayout(migLayout);
		setOpaque(false);

		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						null
		);

		navigationPanel = new JPanel(migLayout);
		navigationPanel.setBackground(Color.white);
		this.add(navigationPanel);

		generalInfoButton = new JButton(GuiConfiguration.getMessage("general"));
		generalInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(generalInfoButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		detailedInfoButton = new JButton(GuiConfiguration.getMessage("detailed"));
		detailedInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(detailedInfoButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		careerButton = new JButton(GuiConfiguration.getMessage("career"));
		careerButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(careerButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		clubStatisticsButton = new JButton(GuiConfiguration.getMessage("clubStatistics"));
		clubStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(clubStatisticsButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		nationalStatisticsButton = new JButton(GuiConfiguration.getMessage("nationalStatistics"));
		nationalStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(nationalStatisticsButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(caseButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/
		generalInfoButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewPlayerGeneralInfo(playerID);
					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});

		detailedInfoButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewPlayerDetailedInfo(playerID);
					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});

		careerButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewPlayerCareer(playerID);
					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});

		clubStatisticsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewPlayerClubStatistic(playerID);

					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);

				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});

		nationalStatisticsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewPlayerNationalStatistic(playerID);

					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);

				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});
		caseButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {

					Component newComponent = new ViewPlayerCase(playerID);

					container.add(newComponent, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);

				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});
	}

	public void setGeneralInfoPanel(Map<String,String> infoTeamMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "playerInformation");
	}
}
