using EDI.Utilities;
using System;

namespace EDIUtilitiesHelper.Console
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                bool success = FileHelper.CopyFiles(@"C:\Vishnu\SourceFolder\test.txt", @"C:\Vishnu\DesitnationFolder\HR\");

            }catch(Exception ex)
            {
                string s = ex.Message;
            }
        }
    }
}
