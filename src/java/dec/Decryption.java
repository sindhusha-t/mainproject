

package dec;

/**
 *
 * @author Sindhusha
 */
public class Decryption {
    
    public String decrypt(String ecardno)
    {
        String cno=ecardno;
		char c[]=cno.toCharArray();
		char c1[]=new char[37];
		int a=((int)c[17])-48;
		for(int i=33;i<69;i++)
		{int x=(int)(((Math.pow(a,i-33)))%37);
			c1[i-33]=c[x+33];
			//System.out.println(x);
			//System.out.print(c1[i-33]+" ");
		}
		//System.out.println();
		c1[36]=c[33];
		//System.out.println(c1);
		int cnt=36;
		int c2[]=new int[37];
		for(int k=0;k<37;k++)
		{
			if((int)c1[k]>=48&&(int)c1[k]<=57)
				c2[k]=((int)c1[k])-48;
			else 
				c2[k]=((int)c1[k])-55;	
		}
		while(cnt>=16)
		{
			for(int i=cnt;i>=1;i--)
			{
				c2[i-1]=c2[i]^c2[i-1];
				//System.out.print(c2[i-1]+" ");
			}
			cnt--;
			//System.out.println();
		}
		char cno1[]=new char[16];
		for(int i=0;i<16;i++)
		{//System.out.print(c2[i]+" ");
		
			cno1[i]=(char)(c2[i]+48);
		}
		String s=new String(cno1);
        return s;
    }
    
}
