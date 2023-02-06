using ExtractAndImportFiles;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace ExtractAndImportFilesConsole
{
    /// <summary>
    /// 
    /// </summary>
    internal class Program
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            try
            {
                ClaimsFileImport fileImport = new ClaimsFileImport(@"C:\Vishnu\ForVidya\Claims_MoveFiles_Project\InputFiles\5_70_837P_FF_0000SRCP.edi", "hr");
                fileImport.CopyFileToLOBFolder();
                Console.WriteLine("File Copied to destination folder successfully !");
            }
            catch(Exception ex)
            {
                string s = ex.Message;
            }
        }
    }
}
