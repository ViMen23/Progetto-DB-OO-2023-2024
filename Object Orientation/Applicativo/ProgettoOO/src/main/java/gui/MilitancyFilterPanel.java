//package gui;
//
//import controller.Controller;
//import model.Country;
//import model.Team;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.beans.PropertyChangeEvent;
//import java.beans.PropertyChangeListener;
//import java.time.Year;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Vector;
//
//public class MilitancyFilterPanel
//							extends JPanel
//{
//	public MilitancyFilterPanel()
//	{
//		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));
//
//		final JLabel ctrlContinentName = new JLabel((String) null);
//		final JLabel ctrlNationName = new JLabel((String) null);
//		final JLabel ctrlTeamType = new JLabel((String) null);
//		final JLabel ctrlTeamName = new JLabel((String) null);
//		final JLabel ctrlFromYear = new JLabel((String) null);
//		final JLabel ctrlToYear = new JLabel((String) null);
//
//
//		final Vector<String> continentNameVector = new Vector<>();
//		final Map<String, String> continentNameMap = new HashMap<>();
//
//		final Vector<String> nationNameVector = new Vector<>();
//		final Map<String, String> nationNameMap = new HashMap<>();
//
//		final Vector<String> teamNameVector = new Vector<>();
//		final Map<String, String> teamNameMap = new HashMap<>();
//
//		final Vector<Vector<String>> playerTableData = new Vector<>();
//		final Map<Integer, String> playerTableDataMap = new HashMap<>();
//
//		MigLayout migLayout;
//		TopSearchPanel topSearchPanel;
//		InfoPanel infoPanel;
//		TitleLabel titleLabel;
//		LabelComboPanel continentTypeNamePanel;
//		LabelComboPanel nationTypeNamePanel;
//		RadioPanel teamTypePanel;
//		LabelComboPanel teamNamePanel;
//		LabelComboPanel fromYearPanel;
//		LabelComboPanel toYearPanel;
//		TablePanel playerTablePanel;
//
//
//		JButton button;
//
//
//		String string;
//
//
//		migLayout = new MigLayout(
//						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
//						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
//		);
//
//
//		this.setLayout(migLayout);
//
//
//		JPanel centralPanel = new JPanel();
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
//						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
//						""//TODO
//		);
//
//		centralPanel.setLayout(migLayout);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		string = GuiConfiguration.getMessage("militancyFilter");
//		string = string.toUpperCase();
//
//		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
//		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);
//
//		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
//
//		string = "1. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("teamType");
//		string = string.toUpperCase();
//
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("info");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//
//		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
//		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		infoPanel = new InfoPanel("Questo e' il secondo info box"); //TODO
//		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		string = "2. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("nation");
//		string += "/";
//		string += GuiConfiguration.getMessage("confederation");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("info");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//
//		string = Country.COUNTRY_TYPE.CONTINENT.toString();
//		string = GuiConfiguration.getMessage(string);
//		string = StringUtils.capitalize(string);
//
//		continentTypeNamePanel = new LabelComboPanel(string, false, ctrlContinentName);
//		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);
//
//		string = Country.COUNTRY_TYPE.NATION.toString();
//		string = GuiConfiguration.getMessage(string);
//		string = StringUtils.capitalize(string);
//
//		nationTypeNamePanel = new LabelComboPanel(string, false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlNationName);
//		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		infoPanel = new InfoPanel("Questo e' il primo info box"); //TODO
//		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		string = "3. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("team");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("info");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("team");
//		string = StringUtils.capitalize(string);
//
//		teamNamePanel = new LabelComboPanel(string, false, ctrlTeamName);
//		centralPanel.add(teamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		infoPanel = new InfoPanel("Questo e' il terzo info box"); //TODO
//		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		string = "4. ";
//		string += GuiConfiguration.getMessage("choose");
//		string += " ";
//		string += GuiConfiguration.getMessage("years");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("info");
//		string = string.toUpperCase();
//		titleLabel = new TitleLabel(string);
//		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("from");
//		string += " ";
//		string += GuiConfiguration.getMessage("year");
//		string = StringUtils.capitalize(string);
//
//		fromYearPanel = new LabelComboPanel(string, false, ctrlFromYear);
//		centralPanel.add(fromYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);
//
//		string = GuiConfiguration.getMessage("to");
//		string += " ";
//		string += GuiConfiguration.getMessage("year");
//		string = StringUtils.capitalize(string);
//
//		toYearPanel = new LabelComboPanel(string, false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlToYear);
//		centralPanel.add(toYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);
//
//		infoPanel = new InfoPanel("Questo e' il quarto info box"); //TODO
//		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//
//		playerTablePanel = new TablePanel(true, null, null, null, null);
//		this.add(playerTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);
//
//
//		string = GuiConfiguration.getMessage("search");
//		string = string.toUpperCase();
//		button = new JButton(string);
//		button.setEnabled(false);
//
//
//		button.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				String string;
//
//				playerTableData.clear();
//
//				Controller.getInstance().setPlayerTable(
//								teamNameMap.get(ctrlTeamName.getText()),
//								ctrlFromYear.getText(),
//								ctrlToYear.getText(),
//								playerTableData,
//								playerTableDataMap
//				);
//
//				playerTablePanel(playerTableData, GuiConfiguration.playerTableColumnName);
//
//
//				string = GuiConfiguration.getMessage("results");
//				string += " ";
//				string += GuiConfiguration.getMessage("players");
//				string += " - ";
//				string += playerTableData.size();
//				string += " ";
//				string += GuiConfiguration.getMessage("results");
//				string = string.toUpperCase();
//
//				playerTablePanel.setTextTitleLabel(string);
//
//				MilitancyFilterPanel.this.revalidate();
//			}
//		});
//
//		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);
//
//
//		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (null != ctrlContinentName.getText()) {
//					continentTypeNamePanel.getMyComboBox().removeAllItems();
//					ctrlContinentName.setText(null);
//				}
//				else {
//					continentTypeNamePanel.getMyComboBox().setEnabled(true);
//				}
//			}
//		});
//
//		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (null == ctrlContinentName.getText()) {
//					nationTypeNamePanel.getMyComboBox().removeAllItems();
//					nationTypeNamePanel.getMyComboBox().setEnabled(false);
//					ctrlNationName.setText(null);
//				}
//				else if (ctrlContinentName.getText().equalsIgnoreCase("@fill")) {
//					continentNameVector.clear();
//					continentNameMap.clear();
//
//					Controller.getInstance().setCountryComboBox(
//									Country.COUNTRY_TYPE.CONTINENT.toString(),
//									null,
//									continentNameVector,
//									continentNameMap
//					);
//
//					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
//				}
//				else {
//					if (null != ctrlNationName.getText()) {
//						nationTypeNamePanel.getMyComboBox().removeAllItems();
//						ctrlNationName.setText(null);
//					}
//					else {
//						nationTypeNamePanel.getMyComboBox().setEnabled(true);
//					}
//				}
//
//			}
//		});
//
//		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (null == ctrlNationName.getText()) {
//					teamNamePanel.getMyComboBox().removeAllItems();
//					teamNamePanel.getMyComboBox().setEnabled(false);
//					ctrlTeamName.setText(null);
//				}
//				else if (ctrlNationName.getText().equalsIgnoreCase("@fill")) {
//					nationNameVector.clear();
//					nationNameMap.clear();
//
//					Controller.getInstance().setCountryComboBox(
//									Country.COUNTRY_TYPE.NATION.toString(),
//									continentNameMap.get(ctrlContinentName.getText()),
//									nationNameVector,
//									nationNameMap
//					);
//
//					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
//				}
//				else {
//					if (null != ctrlTeamName.getText()) {
//						teamNamePanel.getMyComboBox().removeAllItems();
//						ctrlTeamName.setText(null);
//					}
//					else {
//						teamNamePanel.getMyComboBox().setEnabled(true);
//					}
//				}
//			}
//		});
//
//
//		ctrlTeamName.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (null == ctrlTeamName.getText()) {
//					button.setEnabled(false);
//					fromYearPanel.getMyComboBox().setEnabled(false);
//
//					fromYearPanel.getMyComboBox().removeAllItems();
//
//					ctrlFromYear.setText(null);
//				}
//				else if (ctrlTeamName.getText().equalsIgnoreCase("@fill")) {
//					teamNameVector.clear();
//					teamNameMap.clear();
//
//					Controller.getInstance().setTeamComboBox(
//									null,
//									null,
//									ctrlTeamType.getText(),
//									continentNameMap.get(ctrlContinentName.getText()),
//									nationNameMap.get(ctrlNationName.getText()),
//									teamNameVector,
//									teamNameMap
//					);
//
//					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
//				}
//				else {
//					if (null != ctrlFromYear.getText()) {
//						fromYearPanel.getMyComboBox().removeAllItems();
//						ctrlFromYear.setText(null);
//					}
//					else {
//						button.setEnabled(true);
//						fromYearPanel.getMyComboBox().setEnabled(true);
//					}
//				}
//			}
//		});
//
//
//		ctrlFromYear.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (null == ctrlFromYear.getText()) {
//					toYearPanel.getMyComboBox().removeAllItems();
//					toYearPanel.getMyComboBox().setEnabled(false);
//					ctrlToYear.setText(null);
//				}
//				else if (ctrlFromYear.getText().equalsIgnoreCase("@fill")) {
//
//					JComboBox<String> comboBox = fromYearPanel.getMyComboBox();
//
//					comboBox.removeAllItems();
//
//					int maximumYear = Year.now().getValue();
//					int minimumYear = GuiConfiguration.getMinYear();
//
//					for (int i = maximumYear; i >= minimumYear; --i) {
//						comboBox.addItem(String.valueOf(i));
//					}
//				}
//				else {
//					if (null != ctrlToYear.getText()) {
//						toYearPanel.getMyComboBox().removeAllItems();
//						ctrlToYear.setText(null);
//					}
//					else {
//						toYearPanel.getMyComboBox().setEnabled(true);
//					}
//				}
//			}
//		});
//
//
//		ctrlToYear.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (0 == StringUtils.compareIgnoreCase(ctrlToYear.getText(), "@fill")) {
//					JComboBox<String> comboBox = toYearPanel.getMyComboBox();
//
//					comboBox.removeAllItems();
//
//					int maximumYear = Year.now().getValue();
//					int minimumYear = Integer.parseInt(ctrlFromYear.getText());
//
//					for (int i = maximumYear; i >= minimumYear; --i) {
//						comboBox.addItem(String.valueOf(i));
//					}
//				}
//			}
//		});
//	}
//}
