package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;

public class SearchCountryPanel
				extends JPanel
{
	public SearchCountryPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);

		final Vector<String> countryNameVector = new Vector<>();
		final Map<String, String> countryNameMap = new HashMap<>();

		final Vector<Vector<String>> countryTableData = new Vector<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel countryTypePanel;
		InfoPanel infoPanel;
		LabelComboPanel continentNamePanel;
		TablePanel countryTablePanel;
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
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);

		string = GuiConfiguration.getMessage("searchCountries");
		string += " - ";
		string += GuiConfiguration.getMessage("availableCountries");
		string += " ";
		string += Controller.getInstance().countCountries();
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("countryType");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("countryTypeInfo");
		string = StringUtils.capitalize(string);
		infoPanel = new InfoPanel(string);
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("CONTINENT");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		continentNamePanel = new LabelComboPanel(null, false, ctrlContinentName);
		centralPanel.add(continentNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("continentInfo");
		string = StringUtils.capitalize(string);
		infoPanel = new InfoPanel(string);
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		countryTablePanel = new TablePanel(true, null);
		this.add(countryTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();
		button = new JButton(string);
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable countryTable = countryTablePanel.getMyTable();
				String string;

				countryTableData.clear();

				Controller.getInstance().setCountryTable(
								ctrlCountryType.getText(),
								countryNameMap.get(ctrlContinentName.getText()),
								countryTableData
				);

				countryTable.setModel(new TableModel(countryTableData, GuiConfiguration.COUNTRY_TABLE_COLUMN_NAME));
				countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("countries");
				string += " ";
				string += countryTableData.size();
				string = string.toUpperCase();

				countryTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";
				if (ctrlCountryType.getText() != null) {
					string += StringUtils.capitalize(GuiConfiguration.getMessage("countryType"));
					string += ": ";
					string += StringUtils.capitalize(GuiConfiguration.getMessage(ctrlCountryType.getText()));
				}

				if (!ctrlContinentName.getText().equalsIgnoreCase(selectAll)) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += StringUtils.capitalize(GuiConfiguration.getMessage("CONTINENT"));
					string += ": ";
					string += ctrlContinentName.getText();
				}

				countryTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				SearchCountryPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

		ctrlCountryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					continentNamePanel.getMyComboBox().setEnabled(true);
				} else {
					continentNamePanel.getMyComboBox().setEnabled(false);
					continentNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlContinentName.setText(selectAll);
				}
			}
		});

		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlContinentName.getText().equalsIgnoreCase("@fill")) {
					countryNameVector.clear();
					countryNameMap.clear();

					countryNameVector.add(selectAll);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									countryNameVector,
									countryNameMap
					);

					if (1 == countryNameVector.size()) {
						countryNameVector.clear();
						countryNameVector.add(StringUtils.capitalize(GuiConfiguration.getMessage("noData")));
						continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(countryNameVector));
						continentNamePanel.getMyComboBox().setEnabled(false);
						continentNamePanel.getMyComboBox().setSelectedIndex(0);
					}

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(countryNameVector));
				}
			}
		});
	}
}