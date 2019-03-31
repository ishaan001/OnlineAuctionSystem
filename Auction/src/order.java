import java.util.*;

public class order {
		public static void main(String as[])
		{
			int a[][] = new int[2][7];
			Scanner sc = new Scanner(System.in);
			
			for(int i=0;i<7;i++)
			{
				for(int j=0;j<2;j++)
				{
					a[i][j] = sc.nextInt();
				}
			}
			
			System.out.println("Max 3 roll no are");
			
			int m = 0;
			int max[] = new int[7];
			for(int i=0;i<7;i++)
			{
					if(a[i][1]>m)
					{
						m = a[i][1];
					
						max[i] = a[i][0];
					}
			}
			Arrays.sort(max);
			System.out.println(max[6]);
			System.out.println(max[5]);
			System.out.println(max[4]);
}
}
