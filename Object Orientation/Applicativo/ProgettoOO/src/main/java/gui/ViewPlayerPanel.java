package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.LinkedHashMap;
import java.util.Vector;
import java.util.Map;

public class ViewPlayerPanel
				extends JPanel
{
	public ViewPlayerPanel(String playerID)
	{
		final JLabel ctrlClubStatisticsTeamName = new JLabel((String) null);
		final JLabel ctrlClubStatisticsCompetitionName = new JLabel((String) null);
		final JLabel ctrlClubStatisticsInitialSeason = new JLabel((String) null);
		final JLabel ctrlClubStatisticsFinalSeason = new JLabel((String) null);

		final JLabel ctrlNationalStatisticsCompetitionName = new JLabel((String) null);
		final JLabel ctrlNationalStatisticsInitialSeason = new JLabel((String) null);
		final JLabel ctrlNationalStatisticsFinalSeason = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();
		final Vector<Vector<String>> positionTableData = new Vector<>();
		final Vector<Vector<String>> nationalityTableData = new Vector<>();

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
		TopSearchPanel topFilterPanel;
		JPanel clubStatisticsFilterPanel;
		TitleLabel titleLabel;
		LabelComboPanel clubStatisticsTeamNamePanel;
		InfoPanel infoPanel;
		LabelComboPanel clubStatisticsCompetitionNamePanel;
		LabelComboPanel clubStatisticsInitialSeasonPanel;
		LabelComboPanel clubStatisticsFinalSeasonPanel;
		TablePanel clubStatisticsTablePanel;
		JButton clubStatisticsFilterButton;
		JPanel nationalStatisticsPanel;
		JPanel nationalStatisticsFilterPanel;
		LabelComboPanel nationalStatisticsCompetitionNamePanel;
		LabelComboPanel nationalStatisticsInitialSeasonPanel;
		LabelComboPanel nationalStatisticsFinalSeasonPanel;
		TablePanel nationalStatisticsTablePanel;
		JButton nationalStatisticsFilterButton;
		JPanel caseAwardsPanel;
		TablePanel clubTrophyPanel;
		TablePanel nationalTrophyPanel;
		TablePanel prizePanel;




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

		generalInfoButton = new JButton(GuiConfiguration.getMessage("general"));
		generalInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(generalInfoButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		detailedInfoButton = new JButton(GuiConfiguration.getMessage("detailed"));
		detailedInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(detailedInfoButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		careerButton = new JButton(GuiConfiguration.getMessage("career"));
		careerButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(careerButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		clubStatisticsButton = new JButton(GuiConfiguration.getMessage("clubStatistics"));
		clubStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(clubStatisticsButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		nationalStatisticsButton = new JButton(GuiConfiguration.getMessage("nationalStatistics"));
		nationalStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(nationalStatisticsButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(caseButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
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
		positionPanel.getTitleLabel().setText(GuiConfiguration.getMessage("positions"));
		generalInfoTablePanel.add(positionPanel);

		nationalityPanel = new TablePanel(false);
		nationalityPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalities"));
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
		goalkeepingAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("goalkeepingAttributes"));
		detailedInfoTablePanel.add(goalkeepingAttributePanel);

		mentalAttributePanel = new TablePanel(false);
		mentalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("mentalAttributes"));
		detailedInfoTablePanel.add(mentalAttributePanel);

		physicalAttributePanel = new TablePanel(false);
		physicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("physicalAttributes"));
		detailedInfoTablePanel.add(physicalAttributePanel);

		technicalAttributePanel = new TablePanel(false);
		technicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("technicalAttributes"));
		detailedInfoTablePanel.add(technicalAttributePanel);

		tagPanel = new TablePanel(false);
		tagPanel.getTitleLabel().setText(GuiConfiguration.getMessage("tag"));
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
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		clubStatisticsPanel = new JPanel(migLayout);
		clubStatisticsPanel.setOpaque(false);

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT
		);

		clubStatisticsFilterPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("filterClubStatistics"),
						clubStatisticsPanel,
						clubStatisticsFilterPanel
		);
		clubStatisticsPanel.add(topFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);
		clubStatisticsPanel.add(clubStatisticsFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("team").toUpperCase());
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		clubStatisticsTeamNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("team"),
						true,
						ctrlClubStatisticsTeamName
		);
		clubStatisticsFilterPanel.add(clubStatisticsTeamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamInfo"));
		clubStatisticsFilterPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("competition").toUpperCase());
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		clubStatisticsCompetitionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("competition"),
						true,
						ctrlClubStatisticsCompetitionName
		);
		clubStatisticsFilterPanel.add(clubStatisticsCompetitionNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("competitionInfo"));
		clubStatisticsFilterPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("seasonRange").toUpperCase());
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		clubStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		clubStatisticsInitialSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("initialSeason"),
						true,
						ctrlClubStatisticsInitialSeason
		);
		clubStatisticsFilterPanel.add(clubStatisticsInitialSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		clubStatisticsFinalSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("finalSeason"),
						false,
						ctrlClubStatisticsFinalSeason
		);
		clubStatisticsFilterPanel.add(clubStatisticsFinalSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("seasonInfo"));
		clubStatisticsFilterPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		clubStatisticsTablePanel = new TablePanel(true, null);
		clubStatisticsPanel.add(clubStatisticsTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		clubStatisticsFilterButton = new JButton(GuiConfiguration.getMessage("search"));
		clubStatisticsFilterPanel.add(clubStatisticsFilterButton, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		nationalStatisticsPanel = new JPanel(migLayout);
		nationalStatisticsPanel.setOpaque(false);

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT
		);

		nationalStatisticsFilterPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("filterNationalStatistics"),
						clubStatisticsPanel,
						clubStatisticsFilterPanel
		);
		nationalStatisticsPanel.add(topFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);
		nationalStatisticsPanel.add(nationalStatisticsFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("competition").toUpperCase());
		nationalStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		nationalStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		nationalStatisticsCompetitionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("competition"),
						true,
						ctrlNationalStatisticsCompetitionName
		);
		nationalStatisticsFilterPanel.add(nationalStatisticsCompetitionNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("competitionInfo"));
		nationalStatisticsFilterPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("seasonRange").toUpperCase());
		nationalStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		nationalStatisticsFilterPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		nationalStatisticsInitialSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("initialSeason"),
						true,
						ctrlNationalStatisticsInitialSeason
		);
		nationalStatisticsFilterPanel.add(nationalStatisticsInitialSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		nationalStatisticsFinalSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("finalSeason"),
						false,
						ctrlNationalStatisticsFinalSeason
		);
		nationalStatisticsFilterPanel.add(nationalStatisticsFinalSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("seasonInfo"));
		nationalStatisticsFilterPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		nationalStatisticsTablePanel = new TablePanel(true, null);
		nationalStatisticsPanel.add(nationalStatisticsTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		nationalStatisticsFilterButton = new JButton(GuiConfiguration.getMessage("search"));
		nationalStatisticsFilterPanel.add(nationalStatisticsFilterButton, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		caseAwardsPanel = new JPanel(migLayout);
		caseAwardsPanel.setOpaque(false);

		clubTrophyPanel = new TablePanel(false);
		clubTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubTrophies"));
		caseAwardsPanel.add(clubTrophyPanel);

		nationalTrophyPanel = new TablePanel(false);
		nationalTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalTrophies"));
		caseAwardsPanel.add(nationalTrophyPanel);

		prizePanel = new TablePanel(false);
		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));
		caseAwardsPanel.add(prizePanel);

		generalInfoButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable positionTable = positionPanel.getMyTable();
				MyTable nationalityTable = nationalityPanel.getMyTable();

				infoPlayerMap.clear();
				positionTableData.clear();
				nationalityTableData.clear();

				Controller.getInstance().setPlayerGeneralView(
								playerID,
								infoPlayerMap,
								positionTableData,
								nationalityTableData
				);

				generalInfoPanel.createGeneralInfoPanel(infoPlayerMap, "playerInformation");

				positionTable.setModel(new TableModel(positionTableData, GuiConfiguration.PLAYER_POSITION_TABLE_COLUMN_NAME));
				positionTable.setPreferredScrollableViewportSize(positionTable.getPreferredSize());

				nationalityTable.setModel(new TableModel(nationalityTableData, GuiConfiguration.PLAYER_NATIONALITY_TABLE_COLUMN_NAME));
				nationalityTable.setPreferredScrollableViewportSize(nationalityTable.getPreferredSize());

				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(generalInfoTablePanel);
				component.setVisible(false);
				generalInfoTablePanel.setVisible(true);

				revalidate();
			}
		});

		detailedInfoButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(detailedInfoTablePanel);
				component.setVisible(false);
				detailedInfoTablePanel.setVisible(true);

				revalidate();
			}
		});

		careerButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(careerTablePanel);
				component.setVisible(false);
				careerTablePanel.setVisible(true);

				revalidate();
			}
		});
		clubStatisticsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(clubStatisticsPanel);
				component.setVisible(false);
				clubStatisticsPanel.setVisible(true);

				revalidate();
			}
		});

		nationalStatisticsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(nationalStatisticsPanel);
				component.setVisible(false);
				nationalStatisticsPanel.setVisible(true);

				revalidate();
			}
		});

		caseButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = ViewPlayerPanel.this.getComponent(2);
				ViewPlayerPanel.this.remove(component);
				ViewPlayerPanel.this.add(caseAwardsPanel);
				component.setVisible(false);
				caseAwardsPanel.setVisible(true);

				revalidate();
			}
		});




		generalInfoButton.doClick();
	}
}
