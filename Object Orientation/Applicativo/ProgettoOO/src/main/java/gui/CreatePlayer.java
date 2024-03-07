package gui;

import com.github.lgooddatepicker.components.DatePicker;
import com.github.lgooddatepicker.components.DatePickerSettings;
import com.github.lgooddatepicker.optionalusertools.DateChangeListener;
import com.github.lgooddatepicker.zinternaltools.DateChangeEvent;
import controller.Controller;
import model.Country;

import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.LocalDate;
import java.time.Year;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class CreatePlayer
				extends JPanel
{
	public CreatePlayer()
	{
		final JLabel ctrlName = new JLabel((String) null);
		final JLabel ctrlSurname = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlFoot = new JLabel((String) null);
		final JLabel ctrlPositionName = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();

		final Boolean[] ctrlButton = {false, false, false, false, false, false};


		MigLayout migLayout;
		TitleLabel titleLabel;
		JPanel centerPanel;
		LabelTextPanel namePanel;
		LabelTextPanel surnamePanel;
		JPanel panel;
		JLabel label;
		DatePickerSettings datePickerSettings;
		DatePicker datePicker;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		RadioPanel radioPanel;
		JButton button;
		LabelComboPanel positionNamePanel;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgCreatePlayer"));

		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		centerPanel = new JPanel(migLayout);

		this.add(centerPanel);
		/*------------------------------------------------------------------------------------------------------*/

		namePanel = new LabelTextPanel(GuiConfiguration.getMessage("name"), ctrlName, Regex.patternString);

		centerPanel.add(namePanel);
		/*------------------------------------------------------------------------------------------------------*/

		surnamePanel = new LabelTextPanel(GuiConfiguration.getMessage("surname"), ctrlSurname, Regex.patternString);

		centerPanel.add(surnamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		centerPanel.add(panel);

		label = new JLabel(GuiConfiguration.getMessage("dob"), SwingConstants.LEADING);

		panel.add(label);

		datePickerSettings = new DatePickerSettings();

		datePicker = new DatePicker(datePickerSettings);

		datePickerSettings.setDateRangeLimits(
						LocalDate.of(GuiConfiguration.MIN_YEAR, 1, 1),
						LocalDate.of(Year.now().getValue(), 12, 31)
		);
		datePickerSettings.setAllowKeyboardEditing(false);

		datePicker.getComponentDateTextField().getCaret().deinstall(datePicker.getComponentDateTextField());
		datePicker.getComponentToggleCalendarButton().setText(GuiConfiguration.getMessage("chooseDate"));

		panel.add(datePicker);
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
		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		centerPanel.add(panel);


		label = new JLabel(GuiConfiguration.getMessage("foot"));

		panel.add(label);

		radioPanel = new RadioPanel(Player.FOOT_TYPE.values(), ctrlFoot);

		panel.add(radioPanel);
		/*------------------------------------------------------------------------------------------------------*/

		positionNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("position"), true, ctrlPositionName);

		centerPanel.add(positionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("confirm"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		centerPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

			}
		});

		ctrlName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[0] = (null != ctrlName.getText());

				button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
			}
		});

		ctrlSurname.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[1] = (null != ctrlSurname.getText());
				button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
			}
		});

		datePicker.addDateChangeListener(new DateChangeListener() {
			@Override
			public void dateChanged(DateChangeEvent dateChangeEvent)
			{
				ctrlButton[2] = (null != dateChangeEvent.getNewDate());
				button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
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
				else {
					ctrlButton[3] = (null != nationNameMap.get(ctrlNationName.getText()));
					button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
				}
			}
		});

		ctrlFoot.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[4] = (null != ctrlFoot.getText());
				button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
			}
		});
		ctrlPositionName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPositionName.getText(), "@fill")) {
					positionNameVector.clear();
					positionNameMap.clear();

					Controller.getInstance().setPositionComboBox(positionNameVector, positionNameMap);

					if (positionNameVector.isEmpty()) {
						positionNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					positionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(positionNameVector));
				}
				else {
					ctrlButton[5] = (null != positionNameMap.get(ctrlPositionName.getText()));
					button.setEnabled(ctrlButton[0] && ctrlButton[1] && ctrlButton[2] && ctrlButton[3] && ctrlButton[4] && ctrlButton[5]);
				}
			}
		});

	}
}