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
import java.util.Map;
import java.util.Vector;

/**
 * Classe che rappresenta la vista per l'aggiornamento delle statistiche di un giocatore.
 */
public class AdminViewPlayerUpdateStatistic
				extends JPanel
{

	public AdminViewPlayerUpdateStatistic(String playerID,
																				String playID,
																				Map<String, String> statisticTableMap)
	{
		final Vector<String> statisticValueVector = new Vector<>();

		for (int i = 0; i <= 100; ++i) {
			statisticValueVector.add(String.valueOf(i));
		}

		final boolean[] ctrlButton = {false, false, false, false, false, false, false, false};
		final ArrayList<JComboBox<String>> arrayList = new ArrayList<>();

		MigLayout migLayout;
		JPanel panel;
		JLabel label;
		JComboBox<String> comboBox;
		JButton confirmButton;

		int index = 0;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_14P_LAYOUT_CONSTRAINT,
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
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgConfirmData"),
								GuiConfiguration.getMessage("updateStatistics"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {

					String message = Controller.getInstance().updateStatistic(
									playID,
									(String) arrayList.get(0).getSelectedItem(),
									(String) arrayList.get(1).getSelectedItem(),
									(String) arrayList.get(2).getSelectedItem(),
									(String) arrayList.get(3).getSelectedItem(),
									(String) arrayList.get(4).getSelectedItem(),
									(String) arrayList.get(5).getSelectedItem(),
									(String) arrayList.get(6).getSelectedItem(),
									(String) arrayList.get(7).getSelectedItem()
					);

					String[] keyPart = message.split("@");

					for(String string: keyPart) {
						JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(string));
					}
				}

				try {
					AdminViewPlayerUpdateStatistic.this.getParent().getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerUpdateStatistic.this.getParent().getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerUpdateClubStatistic(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		for (String key: statisticTableMap.keySet()) {
			final int j = index;
			label = new JLabel(key);

			panel.add(label);

			comboBox = new JComboBox<>(statisticValueVector);

			comboBox.setCursor(GuiConfiguration.HAND_CURSOR);
			comboBox.setPrototypeDisplayValue("xxxxx");
			comboBox.setMaximumRowCount(7);

			comboBox.addItemListener(new ItemListener() {
				@Override
				public void itemStateChanged(ItemEvent e)
				{
					ctrlButton[j] = !((String) e.getItem()).equalsIgnoreCase(statisticTableMap.get(key));

					for (boolean bool: ctrlButton) {
						if (bool) {
							confirmButton.setEnabled(true);
							return;
						}
					}

					confirmButton.setEnabled(false);
				}
			});

			comboBox.setSelectedItem(statisticTableMap.get(key));
			arrayList.add(comboBox);
			panel.add(comboBox);
			++index;
		}
		/*------------------------------------------------------------------------------------------------------*/

		arrayList.getFirst().addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				if (e.getItem().equals(String.valueOf(0))) {

					if (e.getStateChange() == ItemEvent.SELECTED) {

						for (int i = 1; i < arrayList.size(); ++i) {
							arrayList.get(i).setEnabled(false);
							arrayList.get(i).setSelectedItem(String.valueOf(0));
						}
					} else {

						for (int i = 1; i < arrayList.size(); ++i) {
							arrayList.get(i).setEnabled(true);
						}
					}
				}
			}
		});

		arrayList.getFirst().setSelectedIndex(-1);
		arrayList.getFirst().setSelectedItem(statisticTableMap.get(GuiConfiguration.getMessage("match")));
	}
}
