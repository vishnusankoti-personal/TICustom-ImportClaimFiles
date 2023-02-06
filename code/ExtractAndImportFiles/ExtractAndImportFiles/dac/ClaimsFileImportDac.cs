using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExtractAndImportFiles.dac
{
    /// <summary>
    /// 
    /// </summary>
    public interface IClaimsFileImportDac
    {
        string RetrieveLOBFolderPath(string lineOfBusiness);
    }

    /// <summary>
    /// 
    /// </summary>
    public class ClaimsFileImportDac : IClaimsFileImportDac
    {
        public string TICustom_Connection { get; set; }
        public ClaimsFileImportDac()
        {
            TICustom_Connection = @"Server=localhost\MSSQLSERVER01;Database=TICustom;Trusted_Connection=True;";
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="lineOfBusiness"></param>
        /// <returns></returns>
        public string RetrieveLOBFolderPath(string lineOfBusiness)
        {
            string destinationFolderPath = string.Empty;
            using (SqlConnection con = new SqlConnection(TICustom_Connection))
            {
                using (SqlCommand cmd = new SqlCommand("usp_RetrieveLOBFolderLookup", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@LineOfBusiness", SqlDbType.VarChar).Value = lineOfBusiness;

                    con.Open();
                    destinationFolderPath = (string)cmd.ExecuteScalar();
                    con.Close();
                }
            }
            return destinationFolderPath;
        }
    }
}
