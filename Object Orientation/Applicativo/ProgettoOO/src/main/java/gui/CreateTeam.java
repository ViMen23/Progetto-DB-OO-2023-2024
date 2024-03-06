package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class CreateTeam
				extends JPanel
{

	public CreateTeam()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlLongName = new JLabel((String) null);
		final JLabel ctrlShortName = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		JLabel label;
		LabelTextPanel longNamePanel;
		LabelTextPanel shortNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		JButton button;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		topSearchPanel = new TopSearchPanel(GuiConfiguration.getMessage("msgCreateTeam"));

		this.add(topSearchPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		JPanel centerPanel = new JPanel(migLayout);

		this.add(centerPanel);
		/*------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_20P_30P_EXT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		JPanel panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		label = new JLabel(GuiConfiguration.getMessage("type"));
		panel.add(label);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);

		panel.add(teamTypePanel);

		centerPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		longNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("longName"), ctrlLongName, Regex.patternAlnum);

		centerPanel.add(longNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		shortNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("shortName"), ctrlShortName, Regex.patternCode);

		centerPanel.add(shortNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);

		centerPanel.add(continentNamePanel);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						true,
						ctrlNationName
		);
		centerPanel.add(nationNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("confirm"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		centerPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});


		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				boolean bool = (0 != StringUtils.compareIgnoreCase(ctrlTeamType.getText(), Team.TEAM_TYPE.NATIONAL.toString()));

				longNamePanel.getTextField().setText(null);
				longNamePanel.getTextField().setEnabled(bool);

				shortNamePanel.getTextField().setText(null);
				shortNamePanel.getTextField().setEnabled(bool);
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
				}
			}
		});

	}
}
