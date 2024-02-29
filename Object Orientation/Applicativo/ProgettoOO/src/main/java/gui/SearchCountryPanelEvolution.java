package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.util.Map;
import java.util.Vector;

public class SearchCountryPanelEvolution
				extends JPanel
{

	private String countryType = null;
	private String continentID = null;
	private final ComboBoxPanel comboBoxPanel;

	public SearchCountryPanelEvolution()
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"0[]0",
				"10[]10[]0[]10"
			);

		this.setLayout(migLayout);

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"10[60%, fill]50[35%, fill]10",
				"0[]0[fill]10[]0[fill]20[]0"
			);

		JPanel centralPanel = new JPanel(migLayout);
		centralPanel.setOpaque(false);


		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += " - ";
		string += GuiConfiguration.getMessage("countries");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countCountries().toString();
		string = string.toUpperCase();


		this.add(new TopSearchPanel(string, this, centralPanel), "dock north, sgx e");

		this.add(centralPanel, "dock center, sgx e");


		string = GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("countryType");
		string = string.toUpperCase();

		centralPanel.add(new CountryTypeRadioPanel(string) {
			@Override
			void setCountryType(String string)
			{
				if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.NATION.toString())) {
					comboBoxPanel.setEnableComboBox(false);
				}
				
				countryType = string;

				if (countryType.equalsIgnoreCase(Country.COUNTRY_TYPE.NATION.toString())) {
					comboBoxPanel.setEnableComboBox(true);
				}
			}
		});

		centralPanel.add(new InfoPanel("INFO"));


		string = "Scegli continente che contiene la nazione"; //TODO I18N
		string = string.toUpperCase();

		comboBoxPanel = new ComboBoxPanel(string) {
			@Override
			void fillContinentComboBox(JComboBox<String> comboBox,
									   Vector<String> comboBoxVector,
									   Map<String, String> comboBoxMap)
			{
				Controller.getInstance().setCountryComboBox(
					comboBoxVector,
					comboBoxMap,
					Country.COUNTRY_TYPE.CONTINENT.toString(),
					null
				);
			}

			@Override
			void setContinentID(String ID)
			{
				continentID = ID;
			}
		};

		centralPanel.add(comboBoxPanel);


	}

}
