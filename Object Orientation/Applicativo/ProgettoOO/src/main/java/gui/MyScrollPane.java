package gui;

import javax.swing.*;

public class MyScrollPane
				extends JScrollPane
{
	private final MyTable myTable;
	public MyScrollPane(Boolean sort,
											JLabel controlColumnLabel,
											JLabel controlRowLabel,
											JLabel controlMouseLabel)
	{
		super();

		this.myTable = new MyTable(sort, controlColumnLabel, controlRowLabel, controlMouseLabel);

		this.setViewportView(myTable);
	}

	public MyTable getMyTable()
	{
		return myTable;
	}
}
