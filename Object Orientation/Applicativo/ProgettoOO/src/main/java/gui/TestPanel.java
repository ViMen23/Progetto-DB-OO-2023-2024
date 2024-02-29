package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.InputMethodEvent;
import java.awt.event.InputMethodListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;

public class TestPanel
				extends JPanel
{
	private final JLabel countryType;
	private final JLabel continent;
	private final Vector<String> countryNameVector = new Vector<>();
	private final Map<String, String> countryNameMap = new HashMap<>();
	public TestPanel()
	{
		this.countryType = new JLabel();
		this.continent = new JLabel();

		MigLayout migLayout;

		migLayout = new MigLayout(
						"debug, flowy, fill",
						"0[fill]0",
						"10[]10[]0[]10"
		);

		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();
		migLayout = new MigLayout(
						"debug, wrap 2",
						"10[60%, fill]50[35%, fill]10",
						"0[]0[fill]10[]0[fill]20[]0"
		);
		centralPanel.setLayout(migLayout);

		this.add(new TopSearchPanel("Bottone1", this, centralPanel), "sgx e");

		ArrayList<String> rrr = new ArrayList<>();
		rrr.add("radio1");
		rrr.add("radio2");
		rrr.add("radio3");

		centralPanel.add(new CountryTypeRadioPanel("SCEGLI TIPO PAESE", countryType, this));
		centralPanel.add(new InfoPanel("INFO"));
		centralPanel.add(new TeamTypeRadioPanel("SCEGLI TIPO SQUADRA"));
		centralPanel.add(new InfoPanel("INFO"));
		centralPanel.add(new CompetitionTypeRadioPanel("SCEGLI TIPO COMPETIZIONE"));
		centralPanel.add(new InfoPanel("INFO"));
		centralPanel.add(new PlayerRoleCheckPanel("SCEGLI RUOLO"));
		centralPanel.add(new InfoPanel("INFO"));
		centralPanel.add(new PlayerFootRadioPanel("SCEGLI RUOLO"));
		centralPanel.add(new InfoPanel("INFO"));
		ChooseContinentPanel cc = new ChooseContinentPanel("SCEGLI RUOLO", continent);
		centralPanel.add(cc);
		centralPanel.add(new InfoPanel("INFO"));

		this.add(centralPanel, "sgx e");

		countryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				cc.getMyComboBox().setEnabled(true);
				getValueControl();
			}
		});

		continent.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt) {
				if (continent.getText().equalsIgnoreCase("@fill")) {
					GuiConfiguration.initComboBoxVector(
									countryNameVector,
									countryNameMap,
									true
					);

					Controller.getInstance().setCountryComboBox(
									countryNameVector,
									countryNameMap,
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null
					);


					cc.getMyComboBox().fillComboBox(countryNameVector);
				} else {
					System.out.println(continent.getText());
				}
			}
		});



	}

	public void getValueControl()
	{
		System.out.println(countryType.getText());
	}
}
