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
		final String selectAll = GuiConfiguration.getMessage("selectAll");
		final StringBuilder researchMessage = new StringBuilder();

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


		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_INT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_60P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);

		topSearchPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("msgTopSearchCountryButton") + " " + Controller.getInstance().countCountries(),
						this,
						centralPanel
		);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("countryType").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("msgChooseCountryTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("continent").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		continentNamePanel = new LabelComboPanel(null, false, ctrlContinentName);
		centralPanel.add(continentNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("msgChooseContinentInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		countryTablePanel = new TablePanel(true, null);
		this.add(countryTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		button = new JButton(GuiConfiguration.getMessage("msgSearchButton"));
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable countryTable = countryTablePanel.getMyTable();

				countryTableData.clear();

				Controller.getInstance().setCountryTable(
								ctrlCountryType.getText(),
								countryNameMap.get(ctrlContinentName.getText()),
								countryTableData
				);

				countryTable.setModel(new TableModel(countryTableData, GuiConfiguration.COUNTRY_TABLE_COLUMN_NAME));
				countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());

				countryTablePanel.getTitleLabel().setText(
								GuiConfiguration.getMessage("msgDoneSearch") + " " + countryTableData.size()
				);

				countryTablePanel.getTextArea().setText(researchMessage.toString());
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
				researchMessage.setLength(0);
				researchMessage.append(GuiConfiguration.getMessage("countryType")).append(": ");
				researchMessage.append(GuiConfiguration.getMessage(ctrlCountryType.getText()));
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
						countryNameVector.add(GuiConfiguration.getMessage("msgNoData"));
						continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(countryNameVector));
						continentNamePanel.getMyComboBox().setEnabled(false);
						continentNamePanel.getMyComboBox().setSelectedIndex(0);
					}

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(countryNameVector));
				} else {
					researchMessage.setLength(0);
					researchMessage.append(GuiConfiguration.getMessage("countryType")).append(": ");
					researchMessage.append(GuiConfiguration.getMessage(ctrlCountryType.getText()));
					researchMessage.append('\n').append(GuiConfiguration.getMessage("CONTINENT")).append(": ");
					researchMessage.append(ctrlContinentName.getText());
				}
			}
		});
	}
}