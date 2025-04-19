# Load modules
import re
import csv
import argparse

# Purpose -
# Extract ENSEMBL ID and gene symbol from GTF file to translated between the two
# identifiers in downstream analysis.

# Required input -
# A gtf file to be converted

# Ouput -
# A csv file named genes.csv (default) that contains [gene_id, gene_name]

def extract_genes(gtf_path, output_csv = 'genes.csv'):
    seen = set()
    with open(output_csv, 'w', newline = '') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['gene_id', 'gene_name'])
        with open(gtf_path) as inFile:
            for line in inFile:
                match = re.search(r'gene_id\s+"([^"]+)".*gene_name\s+"([^"]+)"', line)
                if match:
                    gene_id = match.group(1)
                    gene_name = match.group(2)
                    if gene_id not in seen:
                        seen.add(gene_id)
                        writer.writerow([gene_id, gene_name])

def main():
    parser = argparse.ArgumentParser(
        description = "Extract unique gene_id and gene_name pairs from a GTF file."
    )
    parser.add_argument('gtf_file', help = "Input GTF file path")
    parser.add_argument('--out', default = 'genes.csv', 
                        help = "Output CSV file name (default: genes.csv)")
    args = parser.parse_args()
    
    extract_genes(args.gtf_file, args.out)

if __name__ == '__main__':
    main()
