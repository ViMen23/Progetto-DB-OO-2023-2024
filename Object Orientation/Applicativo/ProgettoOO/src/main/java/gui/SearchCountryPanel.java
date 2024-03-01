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
						GuiConfiguration.generalSearchPanelLayoutConstraint,
						GuiConfiguration.generalSearchPanelColumnConstraint,
						GuiConfiguration.generalSearchPanelRowConstraint
		);

		this.setLayout(migLayout);

		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.middleSearchPanelLayoutConstraint,
						GuiConfiguration.middleSearchPanelColumnConstraint,
						GuiConfiguration.middleSearchPanelRowConstraint
		);

		centralPanel.setLayout(migLayout);

		topSearchPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("msgTopSearchCountryButton") + " " + Controller.getInstance().countCountries().toString(),
						this,
						centralPanel
		);
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgCountryType"));
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgContinent"));
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		continentNamePanel = new LabelComboPanel(null, false, ctrlContinentName);
		centralPanel.add(continentNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		countryTablePanel = new TablePanel(true, null, null, null, null);
		this.add(countryTablePanel, GuiConfiguration.tablePanelAddConstraint);

		button = new JButton(GuiConfiguration.getMessage("msgSearchButton"));
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				countryTableData.clear();

				Controller.getInstance().setCountryTable(
								ctrlCountryType.getText(),
								countryNameMap.get(ctrlContinentName.getText()),
								countryTableData
				);

				countryTablePanel.fillTable(countryTableData, GuiConfiguration.countryTableColumnName);

				countryTablePanel.setTextTitleLabel(
								GuiConfiguration.getMessage("msgDoneSearch") + " " + countryTableData.size()
				);

				string = StringUtils.capitalize(GuiConfiguration.getMessage("countryType"));
				string += ": ";

				if (null != ctrlCountryType.getText()) {
					string += GuiConfiguration.getMessage(ctrlCountryType.getText().toLowerCase());
				}

				string += "\n";

				string += StringUtils.capitalize(GuiConfiguration.getMessage("continent"));
				string += ": ";

				if (!(ctrlContinentName.getText().equalsIgnoreCase(selectAll))) {
					string += ctrlContinentName.getText();
				}

				countryTablePanel.setDescriptionTextArea(string);

				topSearchPanel.getTitleButton().doClick();

				SearchCountryPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);

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

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(countryNameVector));
				}
			}
		});
	}
}