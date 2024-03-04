package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;

public class ViewPlayerPanel
				extends JPanel
{
	public ViewPlayerPanel(String playerID)
	{
		MigLayout migLayout;
		GeneralInfoPanel generalInfoPanel;
		JPanel navigationPanel;
		JButton generalInfoButton;
		JButton detailedInfoButton;
		JButton careerButton;
		JButton clubStatisticsButton;
		JButton nationalStatisticsButton;
		JButton caseButton;
		JPanel generalInfoTablePanel;
		TablePanel positionPanel;
		TablePanel nationalityPanel;
		JPanel detailedInfoTablePanel;
		TablePanel goalkeepingAttributePanel;
		TablePanel mentalAttributePanel;
		TablePanel physicalAttributePanel;
		TablePanel technicalAttributePanel;
		TablePanel tagPanel;
		JPanel careerTablePanel;
		TablePanel clubCareerPanel;
		TablePanel nationalCareerPanel;
		JPanel clubStatisticsPanel;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						"0[]10" //TODO
		);

		this.setLayout(migLayout);


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

		generalInfoButton = new JButton(GuiConfiguration.getMessage("generalInformation"));
		generalInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(generalInfoButton);

		detailedInfoButton = new JButton(GuiConfiguration.getMessage("detailedInformation"));
		detailedInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(detailedInfoButton);

		careerButton = new JButton(GuiConfiguration.getMessage("career"));
		careerButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(careerButton);

		clubStatisticsButton = new JButton(GuiConfiguration.getMessage("clubStatistics"));
		clubStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(clubStatisticsButton);

		nationalStatisticsButton = new JButton(GuiConfiguration.getMessage("nationalStatistics"));
		nationalStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(nationalStatisticsButton);

		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(caseButton);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		generalInfoTablePanel = new JPanel(migLayout);
		generalInfoTablePanel.setOpaque(false);

		this.add(generalInfoTablePanel);

		positionPanel = new TablePanel(false);
		positionPanel.getMyTable().setModel(new DefaultTableModel(6, 3));
		positionPanel.getMyTable().setPreferredScrollableViewportSize(positionPanel.getMyTable().getPreferredSize());
		positionPanel.getTitleLabel().setText(GuiConfiguration.getMessage("positions"));

		generalInfoTablePanel.add(positionPanel);

		nationalityPanel = new TablePanel(false);
		nationalityPanel.getMyTable().setModel(new DefaultTableModel(3, 1));
		nationalityPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalities"));
		nationalityPanel.getMyTable().setPreferredScrollableViewportSize(nationalityPanel.getMyTable().getPreferredSize());

		generalInfoTablePanel.add(nationalityPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		detailedInfoTablePanel = new JPanel(migLayout);
		detailedInfoTablePanel.setOpaque(false);


		goalkeepingAttributePanel = new TablePanel(false);
		goalkeepingAttributePanel.getMyTable().setModel(new DefaultTableModel(10, 2));
		goalkeepingAttributePanel.getMyTable().setPreferredScrollableViewportSize(goalkeepingAttributePanel.getMyTable().getPreferredSize());
		goalkeepingAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("goalkeepingAttributes"));

		detailedInfoTablePanel.add(goalkeepingAttributePanel);

		mentalAttributePanel = new TablePanel(false);
		mentalAttributePanel.getMyTable().setModel(new DefaultTableModel(10, 2));
		mentalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("mentalAttributes"));
		nationalityPanel.getMyTable().setPreferredScrollableViewportSize(mentalAttributePanel.getMyTable().getPreferredSize());

		detailedInfoTablePanel.add(mentalAttributePanel);

		physicalAttributePanel = new TablePanel(false);
		physicalAttributePanel.getMyTable().setModel(new DefaultTableModel(5, 2));
		physicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("physicalAttributes"));
		physicalAttributePanel.getMyTable().setPreferredScrollableViewportSize(physicalAttributePanel.getMyTable().getPreferredSize());

		detailedInfoTablePanel.add(physicalAttributePanel);

		technicalAttributePanel = new TablePanel(false);
		technicalAttributePanel.getMyTable().setModel(new DefaultTableModel(5, 2));
		technicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("technicalAttributes"));
		technicalAttributePanel.getMyTable().setPreferredScrollableViewportSize(technicalAttributePanel.getMyTable().getPreferredSize());

		detailedInfoTablePanel.add(technicalAttributePanel);

		tagPanel = new TablePanel(false);
		tagPanel.getMyTable().setModel(new DefaultTableModel(5, 1));
		tagPanel.getTitleLabel().setText(GuiConfiguration.getMessage("tag"));
		tagPanel.getMyTable().setPreferredScrollableViewportSize(tagPanel.getMyTable().getPreferredSize());

		detailedInfoTablePanel.add(tagPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		careerTablePanel = new JPanel(migLayout);
		careerTablePanel.setOpaque(false);

		clubCareerPanel = new TablePanel(false);
		clubCareerPanel.getMyTable().setModel(new DefaultTableModel(5, 1));
		clubCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubCareer"));
		clubCareerPanel.getMyTable().setPreferredScrollableViewportSize(clubCareerPanel.getMyTable().getPreferredSize());

		careerTablePanel.add(clubCareerPanel);

		nationalCareerPanel = new TablePanel(false);
		nationalCareerPanel.getMyTable().setModel(new DefaultTableModel(5, 1));
		nationalCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalCareer"));
		nationalCareerPanel.getMyTable().setPreferredScrollableViewportSize(nationalCareerPanel.getMyTable().getPreferredSize());

		careerTablePanel.add(nationalCareerPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		clubStatisticsPanel = new JPanel(migLayout);
		clubStatisticsPanel.setOpaque(false);

		clubCareerPanel = new TablePanel(false);
		clubCareerPanel.getMyTable().setModel(new DefaultTableModel(5, 1));
		clubCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubCareer"));
		clubCareerPanel.getMyTable().setPreferredScrollableViewportSize(clubCareerPanel.getMyTable().getPreferredSize());

		careerTablePanel.add(clubCareerPanel);

		nationalCareerPanel = new TablePanel(false);
		nationalCareerPanel.getMyTable().setModel(new DefaultTableModel(5, 1));
		nationalCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalCareer"));
		nationalCareerPanel.getMyTable().setPreferredScrollableViewportSize(nationalCareerPanel.getMyTable().getPreferredSize());

		careerTablePanel.add(nationalCareerPanel);



	}
}
