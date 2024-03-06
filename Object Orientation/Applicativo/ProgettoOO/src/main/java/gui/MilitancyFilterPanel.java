package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class MilitancyFilterPanel
							extends JPanel
{
	public MilitancyFilterPanel()
	{
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlFromYear = new JLabel((String) null);
		final JLabel ctrlToYear = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<Vector<String>> playerTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerTableDataMap = new HashMap<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		InfoPanel infoPanel;
		TitleLabel titleLabel;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel fromYearPanel;
		LabelComboPanel toYearPanel;
		TablePanel playerTablePanel;
		JButton button;


		String string;


		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.NINE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/

		topSearchPanel = new TopSearchPanel(GuiConfiguration.getMessage("militancyFilter"), this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_DOCK_CENTER_ADD_CONSTRAINT);

		string = "1. ";
		string += GuiConfiguration.getMessage("teamType");
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "2. ";
		string += GuiConfiguration.getMessage("NATION").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						false,
						ctrlContinentName
		);
		centralPanel.add(continentNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlNationName
		);
		centralPanel.add(nationNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("nationInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "3. ";
		string += GuiConfiguration.getMessage("team").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("team"), false, ctrlTeamName);
		centralPanel.add(teamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "4. ";
		string += GuiConfiguration.getMessage("yearsRange");
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		fromYearPanel = new LabelComboPanel(GuiConfiguration.getMessage("fromYear"), false, ctrlFromYear);
		centralPanel.add(fromYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		toYearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("toYear"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlToYear
		);
		centralPanel.add(toYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("yearsRangeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(playerTablePanel, GuiConfiguration.HGROUP_DOCK_SOUTH_ADD_CONSTRAINT);


		button = new JButton(GuiConfiguration.getMessage("search"));
		button.setEnabled(false);


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable playerTable = playerTablePanel.getMyTable();
				String string;

				playerTableData.clear();
				playerTableDataMap.clear();


				Controller.getInstance().setPlayerTable(
								teamNameMap.get(ctrlTeamName.getText()),
								ctrlFromYear.getText(),
								ctrlToYear.getText(),
								playerTableData,
								playerTableDataMap
				);


				playerTable.setModel(new TableModel(playerTableData, GuiConfiguration.PLAYER_TABLE_COLUMN_NAME));
				playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("players");
				string += " ";
				string += playerTableData.size();
				string = string.toUpperCase();

				playerTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";
				if (ctrlTeamName.getText() != null) {
					string += StringUtils.capitalize(GuiConfiguration.getMessage("team").toUpperCase());
					string += ": ";
					string += ctrlTeamName.getText();
				}

				if (ctrlFromYear.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += StringUtils.capitalize(GuiConfiguration.getMessage("yearsRange"));
					string += ": ";
					string += ctrlFromYear.getText();
					string += "-";

					if (ctrlToYear.getText() != null) {
						string += ctrlToYear.getText();
					} else {
						string += Year.now().toString();
					}
				}

				playerTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				MilitancyFilterPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				continentNamePanel.getMyComboBox().setSelectedIndex(-1);
				continentNamePanel.getMyComboBox().setEnabled(null != ctrlTeamType.getText());
				ctrlContinentName.setText(null);
			}
		});

		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlContinentName.getText(), "@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					if (continentNameVector.isEmpty()) {
						continentNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationNamePanel.getMyComboBox().setEnabled(continentNameMap.get(ctrlContinentName.getText()) != null);
					ctrlNationName.setText(null);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlNationName.getText(), "@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					if (nationNameVector.isEmpty()) {
						nationNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					nationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				} else {
					teamNamePanel.getMyComboBox().setSelectedIndex(-1);
					teamNamePanel.getMyComboBox().setEnabled(nationNameMap.get(ctrlNationName.getText()) != null);
					ctrlTeamName.setText(null);
				}
			}
		});


		ctrlTeamName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTeamName.getText(), "@fill")) {
					teamNameVector.clear();
					teamNameMap.clear();

					Controller.getInstance().setTeamComboBox(
									null,
									null,
									ctrlTeamType.getText(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameMap.get(ctrlNationName.getText()),
									teamNameVector,
									teamNameMap
					);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				} else {
					fromYearPanel.getMyComboBox().setSelectedIndex(-1);
					fromYearPanel.getMyComboBox().setEnabled(teamNameMap.get(ctrlTeamName.getText()) != null);
					button.setEnabled(teamNameMap.get(ctrlTeamName.getText()) != null);
					ctrlFromYear.setText(null);
				}
			}
		});


		ctrlFromYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlFromYear.getText(), "@fill")) {
					JComboBox<String> comboBox = fromYearPanel.getMyComboBox();

					comboBox.removeAllItems();

					int maximumYear = Year.now().getValue();
					int minimumYear = GuiConfiguration.MIN_YEAR;

					for (int i = maximumYear; i >= minimumYear; --i) {
						comboBox.addItem(String.valueOf(i));
					}
				} else {
					toYearPanel.getMyComboBox().setSelectedIndex(-1);
					toYearPanel.getMyComboBox().setEnabled(ctrlFromYear.getText() != null);
					ctrlToYear.setText(null);
				}
			}
		});


		ctrlToYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlToYear.getText(), "@fill")) {
					JComboBox<String> comboBox = toYearPanel.getMyComboBox();

					comboBox.removeAllItems();

					int maximumYear = Year.now().getValue();
					int minimumYear = Integer.parseInt(ctrlFromYear.getText());

					for (int i = maximumYear; i >= minimumYear; --i) {
						comboBox.addItem(String.valueOf(i));
					}
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String playerID;

						playerID = playerTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

						JPanel panel = new ViewPlayerGeneralInfo(playerID);

						MilitancyFilterPanel.this.setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(MilitancyFilterPanel.this);

						MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
						panel.setVisible(true);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}
