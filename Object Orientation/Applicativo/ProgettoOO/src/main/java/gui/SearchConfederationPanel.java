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
		final String selectAll = GuiConfiguration.getMessage("selectAll");

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

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		string = "Scegli confederazione che contiene la confederazione nazione"; //TODO I18N
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		confederationNamePanel = new LabelComboPanel(null, ctrlConfederationName);
		centralPanel.add(confederationNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		confederationTablePanel = new TablePanel(true, null, null, null);
		this.add(confederationTablePanel, GuiConfiguration.tablePanelAddConstraint);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				confederationTableData.clear();

				Controller.getInstance().setConfederationTable(
								ctrlCountryType.getText(),
								confederationNameMap.get(ctrlConfederationName.getText()),
								confederationTableData
				);

				confederationTablePanel.fillTable(confederationTableData, GuiConfiguration.confederationTableColumnName);


				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("confederations");
				string += " - ";
				string += confederationTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				confederationTablePanel.setTextTitleLabel(string);

				SearchConfederationPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);


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

					Controller.getInstance().setCountryComboBox(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						confederationNameVector,
						confederationNameMap
					);

					confederationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
				}
			}
		});
	}
}