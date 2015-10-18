using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateDemo
{
    public partial class CalculateEMI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void button1_Click(object sender, EventArgs e)
        {
            double LoanAmount = 0;
            double Payment = 0;
            double InterestRate = 0;
            int PaymentPeriods = 0;
            try
            {
                InterestRate = Convert.ToDouble(txtInterest.Text);
                PaymentPeriods = Convert.ToInt16(Convert.ToDouble(txtTenure.Text) * 12);
                LoanAmount = Convert.ToDouble(txtLoanAmount.Text);
                if (InterestRate > 1)
                {
                    InterestRate = InterestRate / 100;
                }
                Payment = (LoanAmount * Math.Pow((InterestRate / 12) + 1,
                          (PaymentPeriods)) * InterestRate / 12) / (Math.Pow
                          (InterestRate / 12 + 1, (PaymentPeriods)) - 1);
                //txtEMIAmount.Text = "Monthly Payment: " + Payment.ToString("N2");
                txtEMIAmount.Text = Payment.ToString("N2");
                //double Part1 = (LoanAmount * InterestRate);
                //double numirator = (Math.Pow((1 + InterestRate), PaymentPeriods));
                //double denomitor = (numirator - 1);
                //double Part2 = numirator / denomitor;
                //double calculatedEMIResult = Part1 * Part2;
                //txtEMIAmount.Text = calculatedEMIResult.ToString("N2");
            }
            catch
            {

            }
        }

    }
}