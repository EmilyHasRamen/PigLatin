import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int n = 0; n<sWord.length(); n++)
	{
		String x = sWord.substring(n,n+1);

		if(x.equals("a")||x.equals("e")||x.equals("i")||x.equals("o")||x.equals("u"))
		{
				return n;
		}
	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	String newString = new String();
	int nFirstVowel = findFirstVowel(sWord);
//System.out.println("("+sWord.substring(0, 1)+")");
	if(nFirstVowel == 0)		// word begins with vowel
	{
		return sWord + "way";
	}
	else if(sWord.substring(0, 2).equals("qu"))	// word begins with "qu"
	{
		return sWord.substring(2,sWord.length()) + "quay";
	}
	else if(nFirstVowel == -1)	// no vowel in word
	{
		return sWord + "ay";
	}
	else if(nFirstVowel>0)	// word has consonant(s) then vowel(s)
	{
		return sWord.substring(nFirstVowel,sWord.length())+sWord.substring(0,nFirstVowel)+ "ay";
	}
	else
	{
		return sWord + " = ERROR!";
	}
}
