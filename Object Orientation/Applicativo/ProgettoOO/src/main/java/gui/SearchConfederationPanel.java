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
		final JLabel countryType = new JLabel((String) null);
		final JLabel continent = new JLabel("@null");

		final Vector<String> confederationNameVector = new Vector<>();
		final Map<String, String> confederationNameMap = new HashMap<>();

		final Vector<String> confederationTableColumnName = new Vector<>();
		final Vector<Vector<String>> confederationTableData = new Vector<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titlePanel;
		RadioPanel radioPanel;
		InfoPanel infoPanel;
		LabelComboPanel chooseContinentPanel;
		TablePanel tablePanel;
		JButton button;

		String string;


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


		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("confederations");
		string += " - ";
		string += GuiConfiguration.getMessage("confederations");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countCountries().toString();
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("confederationType");
		string = string.toUpperCase();

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		radioPanel = new RadioPanel(Country.COUNTRY_TYPE.values(), countryType);
		centralPanel.add(radioPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		string = "Scegli confederazione che contiene la confederazione nazione"; //TODO I18N
		string = string.toUpperCase();

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		chooseContinentPanel = new LabelComboPanel(null, continent);
		centralPanel.add(chooseContinentPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		tablePanel = new TablePanel(true, null, null, null);
		this.add(tablePanel, GuiConfiguration.tablePanelAddConstraint);


		button = new JButton("CERCA");
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				confederationTableData.clear();

				Controller.getInstance().setCountryTable(
					countryType.getText(),
					confederationNameMap.get(continent.getText()),
					confederationTableData
				);

				tablePanel.fillTable(confederationTableData, GuiConfiguration.confederationTableColumnName);


				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("confederations");
				string += " - ";
				string += confederationTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				tablePanel.setTextTitleLabel(string);

				SearchConfederationPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);


		countryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{

				if (0 == StringUtils.compareIgnoreCase(countryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					chooseContinentPanel.getMyComboBox().setEnabled(true);
				}
				else {
					chooseContinentPanel.getMyComboBox().setSelectedIndex(-1);
					continent.setText("@null");
				}

			}
		});

		continent.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (continent.getText().equalsIgnoreCase("@fill")) {
					confederationNameVector.clear();
					confederationNameMap.clear();

					String string;
					string = GuiConfiguration.getMessage("selectAll");
					string = StringUtils.capitalize(string);
					confederationNameVector.add(string);

					Controller.getInstance().setCountryComboBox(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						confederationNameVector,
						confederationNameMap
					);

					chooseContinentPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
				}
			}
		});
	}
}