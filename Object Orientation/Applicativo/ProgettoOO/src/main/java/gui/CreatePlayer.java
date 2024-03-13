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
		final boolean[] ctrlButton = {false, false, false, false, false, false};

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
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

		topSearchPanel = new TopSearchPanel(GuiConfiguration.getMessage("msgCreatePlayer"), this, false);

		this.add(topSearchPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
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
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
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
						LocalDate.of(Year.now().getValue(), 12, 31).minusYears(GuiConfiguration.MIN_AGE)
		);
		datePickerSettings.setAllowKeyboardEditing(false);

		datePicker.getComponentDateTextField().setEditable(false);
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
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
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
		button.setEnabled(false);

		centerPanel.add(button, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String message;


				message = Controller.getInstance().newPlayer(
								ctrlName.getText(),
								ctrlSurname.getText(),
								datePicker.getDateStringOrEmptyString(),
								nationNameMap.get(ctrlNationName.getText()),
								ctrlFoot.getText(),
								positionNameMap.get(ctrlPositionName.getText())
				);

				JOptionPane.showMessageDialog(
								null,
								GuiConfiguration.getMessage(message)
				);

				try {
					CreatePlayer.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(CreatePlayer.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new MenuBarPanel(new CreatePlayer()),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[0] = (null != ctrlName.getText());

				for (boolean bool: ctrlButton) {
					if (!bool) {
						button.setEnabled(false);
						return;
					}
				}

				button.setEnabled(true);
			}
		});

		ctrlSurname.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[1] = (null != ctrlSurname.getText());

				for (boolean bool: ctrlButton) {
					if (!bool) {
						button.setEnabled(false);
						return;
					}
				}

				button.setEnabled(true);
			}
		});

		datePicker.addDateChangeListener(new DateChangeListener() {
			@Override
			public void dateChanged(DateChangeEvent dateChangeEvent)
			{
				ctrlButton[2] = (null != dateChangeEvent.getNewDate());

				for (boolean bool: ctrlButton) {
					if (!bool) {
						button.setEnabled(false);
						return;
					}
				}

				button.setEnabled(true);
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

					for (boolean bool: ctrlButton) {
						if (!bool) {
							button.setEnabled(false);
							return;
						}
					}

					button.setEnabled(true);
				}
			}
		});

		ctrlFoot.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[4] = (null != ctrlFoot.getText());

				for (boolean bool: ctrlButton) {
					if (!bool) {
						button.setEnabled(false);
						return;
					}
				}

				button.setEnabled(true);
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

					for (boolean bool: ctrlButton) {
						if (!bool) {
							button.setEnabled(false);
							return;
						}
					}

					button.setEnabled(true);
				}
			}
		});

	}
}
