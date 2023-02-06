using ExtractAndImportFiles.dac;
using System.IO;

namespace ExtractAndImportFiles
{
    public class ClaimsFileImport
    {
        public string ClaimsFilePath { get; set; }
        public string LineOfBusiness { get; set; }

        public IClaimsFileImportDac claimsFileImportDac { get; set; }

        public ClaimsFileImport()
        {

        }
        public ClaimsFileImport(string ClaimsFilePath, string LineOfBusiness)
        {
            this.ClaimsFilePath = ClaimsFilePath;
            this.LineOfBusiness = LineOfBusiness;
            this.claimsFileImportDac = new ClaimsFileImportDac();
        }

        public bool CopyFileToLOBFolder()
        {
            string destinationFolderPath = claimsFileImportDac.RetrieveLOBFolderPath(LineOfBusiness);
            string inputFileName = RetrieveClaimsFileName();

            File.Copy(ClaimsFilePath, $"{destinationFolderPath}{inputFileName}", true);
            return true;

        }

        private string RetrieveClaimsFileName()
        {
            string fileName = string.Empty;
            string[] filePathArray = this.ClaimsFilePath.Split('\\');
            fileName = filePathArray[filePathArray.Length - 1];
            return fileName;
        }



    }
}
