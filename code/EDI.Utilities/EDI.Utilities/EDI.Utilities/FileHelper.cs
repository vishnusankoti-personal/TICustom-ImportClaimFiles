using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDI.Utilities
{
    public static class FileHelper
    {
        public static bool CopyFiles(string sourceFilePath, string destinationFolderPath)
        {
            bool success = false;
            try
            {
                string inputFileName = RetrieveFile(sourceFilePath);
                File.Copy(sourceFilePath, $"{destinationFolderPath}{inputFileName}", true);

            }catch(Exception ex)
            {
                throw ex;
            }
            success = true;
            return success;
        }


        private static string RetrieveFile(string filePath)
        {
            string fileName = string.Empty;
            string[] filePathArray = filePath.Split('\\');
            fileName = filePathArray[filePathArray.Length - 1];
            return fileName;
        }
    }
}
