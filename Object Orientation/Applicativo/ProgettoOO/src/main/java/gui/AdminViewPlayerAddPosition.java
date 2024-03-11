package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerAddPosition
				extends JPanel
{
	public AdminViewPlayerAddPosition(String playerID)
	{
		final JLabel ctrlPositionName = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addPlayerPosition"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		positionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("position"),
						true,
						ctrlPositionName
		);

		this.add(positionNamePanel);
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

				String message = Controller.getInstance().addPlayerPosition(playerID, positionNameMap.get(ctrlPositionName.getText()));

				System.out.println(message);

				try {
					AdminViewPlayerAddPosition.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerAddPosition.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddPosition(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
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
					confirmButton.setEnabled(null != positionNameMap.get(ctrlPositionName.getText()));
				}
			}
		});
	}

}
