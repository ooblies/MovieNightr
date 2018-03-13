using System;
using System.IO;
using Amazon.S3;
using Amazon.S3.Model;
using System.Configuration;

namespace MovieNightr.IMDB
{
    class GetObject
    {
        static IAmazonS3 client;

        static string srcBucket = ConfigurationManager.AppSettings["sourceBucket"];
        static string srcKeyBase = ConfigurationManager.AppSettings["sourceKey"];
        static string destBucket = ConfigurationManager.AppSettings["destinationBucket"];
        static string destKeyBase = ConfigurationManager.AppSettings["destinationKey"];

        public static void Main(string[] args)
        {
            try
            {
                string files = ConfigurationManager.AppSettings["imdbFiles"];
                foreach (var file in files.Split(','))
                {
                    Console.Write("Copying - " + file + ".");

                    CopyObject(file);
                }

            }
            catch (AmazonS3Exception s3Exception)
            {
                Console.WriteLine(s3Exception.Message,
                                  s3Exception.InnerException);
            }
        }

        static void CopyObject(string file)
        {
            using (client = new AmazonS3Client(Amazon.RegionEndpoint.USEast1))
            {
                CopyObjectRequest request = new CopyObjectRequest
                {
                    SourceBucket = srcBucket,
                    SourceKey = srcKeyBase + file,
                    DestinationBucket = destBucket,
                    DestinationKey = destKeyBase + file,
                    RequestPayer = RequestPayer.Requester,
                };

                var response = client.CopyObject(request);
            }

            Console.WriteLine("..Done.");
        }
    }
}