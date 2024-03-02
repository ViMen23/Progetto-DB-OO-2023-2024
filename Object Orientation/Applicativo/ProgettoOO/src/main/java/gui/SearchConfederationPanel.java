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

public class SearchConfederationPanel
	extends JPanel
{
	public SearchConfederationPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlConfederationName = new JLabel(selectAll);

		final Vector<String> confederationNameVector = new Vector<>();
		final Map<String, String> confederationNameMap = new HashMap<>();

		final Vector<Vector<String>> confederationTableData = new Vector<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel countryTypePanel;
		InfoPanel infoPanel;
		LabelComboPanel confederationNamePanel;
		TablePanel confederationTablePanel;
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

		string = GuiConfiguration.getMessage("searchConfederations");
		string += " - ";
		string += GuiConfiguration.getMessage("availableConfederations");
		string += " ";
		string += Controller.getInstance().countConfederations().toString();
		string = string.toUpperCase();
		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("confederationType");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("confederationTypeInfo");
		string = StringUtils.capitalize(string);
		infoPanel = new InfoPanel(string);
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("continentConfederation");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		confederationNamePanel = new LabelComboPanel(null, false, ctrlConfederationName);
		centralPanel.add(confederationNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("continentConfederationInfo");
		string = StringUtils.capitalize(string);
		infoPanel = new InfoPanel(string);
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		confederationTablePanel = new TablePanel(true, null);
		this.add(confederationTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();
		button = new JButton(string);
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable countryTable = confederationTablePanel.getMyTable();
				String string = "WE";

				confederationTableData.clear();

				Controller.getInstance().setConfederationTable(
								ctrlCountryType.getText(),
								confederationNameMap.get(ctrlConfederationName.getText()),
								confederationTableData
				);

				countryTable.setModel(new TableModel(confederationTableData, GuiConfiguration.CONFEDERATION_TABLE_COLUMN_NAME));
				countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("confederations");
				string += " ";
				string += confederationTableData.size();
				string = string.toUpperCase();

				confederationTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlCountryType.getText() != null) {
					string += StringUtils.capitalize(GuiConfiguration.getMessage("confederationType"));
					string += ": ";
					string += StringUtils.capitalize(GuiConfiguration.getMessage(ctrlCountryType.getText()));
				}

				if (!ctrlConfederationName.getText().equalsIgnoreCase(selectAll)) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += StringUtils.capitalize(GuiConfiguration.getMessage("continentConfederation"));
					string += ": ";
					string += ctrlConfederationName.getText();
				}

				confederationTablePanel.getTextArea().setText(string);
				topSearchPanel.getTitleButton().doClick();
				SearchConfederationPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlCountryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					confederationNamePanel.getMyComboBox().setEnabled(true);
				} else {
					confederationNamePanel.getMyComboBox().setEnabled(false);
					confederationNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlConfederationName.setText(selectAll);
				}
			}
		});

		ctrlConfederationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlConfederationName.getText().equalsIgnoreCase("@fill")) {
					confederationNameVector.clear();
					confederationNameMap.clear();

					confederationNameVector.add(selectAll);

					Controller.getInstance().setConfederationComboBox(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						confederationNameVector,
						confederationNameMap
					);

					if (1 == confederationNameVector.size()) {
						confederationNameVector.clear();
						confederationNameVector.add(StringUtils.capitalize(GuiConfiguration.getMessage("noData")));
						confederationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
						confederationNamePanel.getMyComboBox().setEnabled(false);
						confederationNamePanel.getMyComboBox().setSelectedIndex(0);
					}

					confederationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
				}
			}
		});
	}
}