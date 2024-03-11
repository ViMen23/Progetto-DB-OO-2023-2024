package gui;

import com.github.lgooddatepicker.components.DatePicker;
import com.github.lgooddatepicker.components.DatePickerSettings;
import com.github.lgooddatepicker.optionalusertools.DateChangeListener;
import com.github.lgooddatepicker.zinternaltools.DateChangeEvent;
import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalDate;
import java.time.Year;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminViewPlayerUpdateRetiredDate
				extends JPanel
{
	public AdminViewPlayerUpdateRetiredDate(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		final String prevRetiredDate = infoPlayerMap.get(GuiConfiguration.getMessage("retiredDate"));

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		JPanel panel;
		JLabel label;
		DatePickerSettings datePickerSettings;
		DatePicker datePicker;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("updateRetiredDate"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);

		label = new JLabel(GuiConfiguration.getMessage("retiredDate"), SwingConstants.LEADING);

		panel.add(label);

		datePickerSettings = new DatePickerSettings();

		datePicker = new DatePicker(datePickerSettings);

		datePickerSettings.setDateRangeLimits(
						LocalDate.parse(infoPlayerMap.get(GuiConfiguration.getMessage("dob"))),
						LocalDate.of(Year.now().getValue(), 12, 31)
		);
		datePickerSettings.setAllowKeyboardEditing(false);

		datePicker.setDate(LocalDate.parse(prevRetiredDate));

		datePicker.getComponentDateTextField().getCaret().deinstall(datePicker.getComponentDateTextField());
		datePicker.getComponentToggleCalendarButton().setText(GuiConfiguration.getMessage("chooseDate"));

		panel.add(datePicker);
		/*------------------------------------------------------------------------------------------------------*/

		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

//				String message = Controller.getInstance().addPlayerPosition(playerID, positionNameMap.get(ctrlPositionName.getText()));
//
//				System.out.println(message);

				try {
					AdminViewPlayerUpdateRetiredDate.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerUpdateRetiredDate.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateRetiredDate(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		datePicker.addDateChangeListener(new DateChangeListener() {
			@Override
			public void dateChanged(DateChangeEvent dateChangeEvent)
			{
				confirmButton.setEnabled(null != dateChangeEvent.getNewDate() && !(dateChangeEvent.getNewDate().isEqual(LocalDate.parse(prevRetiredDate))));
			}
		});
	}

}
