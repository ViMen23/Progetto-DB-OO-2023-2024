package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import java.util.List;

public class AdminViewPlayerUpdateGoalkeepingAttribute
				extends JPanel
{
	public AdminViewPlayerUpdateGoalkeepingAttribute(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> attributeTableData = new Vector<>();

		final Vector<String> attributeValueVector = new Vector<>(List.of(
						String.valueOf(1),
						String.valueOf(2),
						String.valueOf(3),
						String.valueOf(4),
						String.valueOf(5),
						String.valueOf(6),
						String.valueOf(7),
						String.valueOf(8),
						String.valueOf(9),
						String.valueOf(10)
		));

		final boolean[] ctrlButton = {false, false, false, false, false, false, false, false, false, false, false, false, false, false};
		final ArrayList<JComboBox<String>> arrayList = new ArrayList<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setAttributeGoalkeepingTable(playerID, attributeTableData);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		JPanel panel;
		JLabel label;
		JComboBox<String> comboBox;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);
		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "BOH"); //TODO

				String message = Controller.getInstance().updateAttributeGoalkeeping(
								playerID,
								(String) arrayList.get(0).getSelectedItem(),
								(String) arrayList.get(1).getSelectedItem(),
								(String) arrayList.get(2).getSelectedItem(),
								(String) arrayList.get(3).getSelectedItem(),
								(String) arrayList.get(4).getSelectedItem(),
								(String) arrayList.get(5).getSelectedItem(),
								(String) arrayList.get(6).getSelectedItem(),
								(String) arrayList.get(7).getSelectedItem(),
								(String) arrayList.get(8).getSelectedItem(),
								(String) arrayList.get(9).getSelectedItem(),
								(String) arrayList.get(10).getSelectedItem(),
								(String) arrayList.get(11).getSelectedItem(),
								(String) arrayList.get(12).getSelectedItem()
				);

				System.out.println(message);

				try {
					AdminViewPlayerUpdateGoalkeepingAttribute.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerUpdateGoalkeepingAttribute.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateGoalkeepingAttribute(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		for (int i = 0; i< attributeTableData.size(); ++i) {
			final int j = i;
			label = new JLabel(attributeTableData.get(i).getFirst());

			panel.add(label);

			comboBox = new JComboBox<>(attributeValueVector);

			comboBox.setCursor(GuiConfiguration.HAND_CURSOR);
			comboBox.setPrototypeDisplayValue("xxxxx");
			comboBox.setMaximumRowCount(7);
			comboBox.setSelectedItem(attributeTableData.get(i).getLast());

			comboBox.addItemListener(new ItemListener() {
				@Override
				public void itemStateChanged(ItemEvent e)
				{
					ctrlButton[j] = !((String) e.getItem()).equalsIgnoreCase(attributeTableData.get(j).getLast());

					for (int i = 0; i < attributeTableData.size(); ++i) {
						if (ctrlButton[i]) {
							confirmButton.setEnabled(true);
							return;
						}
					}

					confirmButton.setEnabled(false);
				}
			});

			arrayList.add(comboBox);
			panel.add(comboBox);
		}
		/*------------------------------------------------------------------------------------------------------*/

	}
}
