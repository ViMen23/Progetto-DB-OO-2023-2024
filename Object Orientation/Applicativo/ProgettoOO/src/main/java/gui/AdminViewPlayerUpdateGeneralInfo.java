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
import java.util.*;

public class AdminViewPlayerUpdateGeneralInfo
				extends JPanel
{
	public AdminViewPlayerUpdateGeneralInfo(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		final String prevName = infoPlayerMap.get(GuiConfiguration.getMessage("name").toUpperCase());
		final String prevSurname = infoPlayerMap.get(GuiConfiguration.getMessage("surname").toUpperCase());
		final String prevDob = infoPlayerMap.get(GuiConfiguration.getMessage("dob").toUpperCase());
		final String prevBornCountry = infoPlayerMap.get(GuiConfiguration.getMessage("bornCountry"));
		final String prevFoot = infoPlayerMap.get(GuiConfiguration.getMessage("foot").toUpperCase());
		final String prevMainPosition = infoPlayerMap.get(GuiConfiguration.getMessage("mainPosition"));

		final JLabel ctrlName = new JLabel(prevName);
		final JLabel ctrlSurname = new JLabel(prevSurname);
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
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelTextPanel namePanel;
		LabelTextPanel surnamePanel;
		JPanel panel;
		JLabel label;
		DatePickerSettings datePickerSettingsDob;
		DatePicker datePickerDob;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		RadioPanel radioPanel;
		LabelComboPanel positionNamePanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("editGeneralInfo"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		namePanel = new LabelTextPanel(GuiConfiguration.getMessage("name"), ctrlName, Regex.patternString);
		namePanel.getTextField().setText(prevName);
		this.add(namePanel);
		/*------------------------------------------------------------------------------------------------------*/

		surnamePanel = new LabelTextPanel(GuiConfiguration.getMessage("surname"), ctrlSurname, Regex.patternString);
		surnamePanel.getTextField().setText(prevSurname);
		this.add(surnamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);

		label = new JLabel(GuiConfiguration.getMessage("dob"), SwingConstants.LEADING);

		panel.add(label);

		datePickerSettingsDob = new DatePickerSettings();

		datePickerDob = new DatePicker(datePickerSettingsDob);

		datePickerSettingsDob.setDateRangeLimits(
						LocalDate.of(GuiConfiguration.MIN_YEAR, 1, 1),
						LocalDate.of(Year.now().getValue(), 12, 31).minusYears(GuiConfiguration.MIN_AGE)
		);
		datePickerSettingsDob.setAllowKeyboardEditing(false);

		datePickerDob.setDate(LocalDate.parse(prevDob));
		datePickerDob.getComponentDateTextField().setEditable(false);
		datePickerDob.getComponentToggleCalendarButton().setText(GuiConfiguration.getMessage("chooseDate"));

		panel.add(datePickerDob);
		/*------------------------------------------------------------------------------------------------------*/

		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);
		this.add(continentNamePanel);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						true,
						ctrlNationName
		);

		this.add(nationNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);


		label = new JLabel(GuiConfiguration.getMessage("foot"));

		panel.add(label);

		radioPanel = new RadioPanel(Player.FOOT_TYPE.values(), ctrlFoot, prevFoot);

		panel.add(radioPanel);
		/*------------------------------------------------------------------------------------------------------*/

		positionNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("position"), true, ctrlPositionName);

		this.add(positionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				String message = Controller.getInstance().updatePlayer(
								playerID,
								ctrlName.getText(),
								ctrlSurname.getText(),
								datePickerDob.getDateStringOrEmptyString(),
								nationNameMap.get(ctrlNationName.getText()),
								ctrlFoot.getText(),
								positionNameMap.get(ctrlPositionName.getText())
				);

				System.out.println(message);

				try {
					AdminViewPlayerUpdateGeneralInfo.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerUpdateGeneralInfo.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateGeneralInfo(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch (Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});


		ctrlName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[0] = !(null == ctrlName.getText() || ctrlName.getText().equalsIgnoreCase(prevName));

				for(boolean bool: ctrlButton) {
					if (bool) {
						confirmButton.setEnabled(true);
						return;
					}
				}
				confirmButton.setEnabled(false);
			}
		});

		ctrlSurname.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[1] = !(null == ctrlSurname.getText() || ctrlSurname.getText().equalsIgnoreCase(prevSurname));

				for(boolean bool: ctrlButton) {
					if (bool) {
						confirmButton.setEnabled(true);
						return;
					}
				}
				confirmButton.setEnabled(false);

			}
		});

		datePickerDob.addDateChangeListener(new DateChangeListener() {
			@Override
			public void dateChanged(DateChangeEvent dateChangeEvent)
			{
				ctrlButton[2] = !(null == dateChangeEvent.getNewDate() || datePickerDob.getDateStringOrEmptyString().equalsIgnoreCase(prevDob));

				for(boolean bool: ctrlButton) {
					if (bool) {
						confirmButton.setEnabled(true);
						return;
					}
				}
				confirmButton.setEnabled(false);
			}
		});

		ctrlContinentName.addPropertyChangeListener("text", new PropertyChangeListener() {
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

		ctrlNationName.addPropertyChangeListener("text", new PropertyChangeListener() {
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
					ctrlButton[3] = !(null == nationNameMap.get(ctrlNationName.getText()) || ctrlNationName.getText().equalsIgnoreCase(prevBornCountry));

					for(boolean bool: ctrlButton) {
						if (bool) {
							confirmButton.setEnabled(true);
							return;
						}
					}
					confirmButton.setEnabled(false);
				}
			}
		});

		ctrlFoot.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[4] = !(null == ctrlFoot.getText() || GuiConfiguration.getMessage(ctrlFoot.getText()).equalsIgnoreCase(prevFoot));

				for(boolean bool: ctrlButton) {
					if (bool) {
						confirmButton.setEnabled(true);
						return;
					}
				}
				confirmButton.setEnabled(false);
			}
		});
		ctrlPositionName.addPropertyChangeListener("text", new PropertyChangeListener() {
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
					String[] keyPart = ctrlPositionName.getText().split("]");
					ctrlButton[5] = (null != positionNameMap.get(ctrlPositionName.getText())  && prevMainPosition.contains(keyPart[1]));

					for(boolean bool: ctrlButton) {
						if (bool) {
							confirmButton.setEnabled(true);
							return;
						}
					}
					confirmButton.setEnabled(false);

				}
			}
		});

		nationNamePanel.getMyComboBox().firePopupMenuWillBecomeVisible();
		nationNamePanel.getMyComboBox().setSelectedItem(prevBornCountry);
		nationNamePanel.getMyComboBox().firePopupMenuWillBecomeInvisible();

		positionNamePanel.getMyComboBox().firePopupMenuWillBecomeVisible();

		int size = positionNamePanel.getMyComboBox().getItemCount();
		for (int i = 0; i < size; ++i) {
			if (positionNamePanel.getMyComboBox().getItemAt(i).contains(prevMainPosition)) {
				positionNamePanel.getMyComboBox().setSelectedIndex(i);
			}
		}

		positionNamePanel.getMyComboBox().firePopupMenuWillBecomeInvisible();

		confirmButton.setEnabled(false);
	}
}
