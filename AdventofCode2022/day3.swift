//
//  File.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 03/12/2022.
//

import Foundation

func day3() {
    let input = day3PuzzleInput.split(separator: "\n")
    
    var commonItems: Array<Character> = []
    var prioritySum = 0
    
    for rucksack in input {
        let rucksackItems = Array(rucksack) //pretty neat!
        let endOfFirstCompartment = rucksackItems.count / 2
        
        let compartment1 = Set(rucksackItems[..<endOfFirstCompartment])
        let compartment2 = Set(rucksackItems[endOfFirstCompartment...])
                
        let commonItem = compartment1.intersection(compartment2)
        
        commonItems.append(contentsOf: commonItem)
//        commonItems.append(commonItem) // for some reason, this doesn't work -> to explore later
//        commonItems += commonItem // this also works
    }
        
    for commonItem in commonItems {
        let utf8ForCommonItem = Int(Array(commonItem.utf8)[0])
        var priority: Int
        
        if commonItem.isUppercase {
            priority = utf8ForCommonItem - 38
        } else {
            priority = utf8ForCommonItem - 96
        }
        
        prioritySum += priority
    }
    
    print (prioritySum)
    
    var badgePrioritySum = 0
    
    for group in stride(from: 2, to: input.count, by: 3) {
        let group1 = Set(input[group-2])
        let group2 = Set(input[group-1])
        let group3 = Set(input[group])
        
        let badge = String(group1.intersection(group2.intersection(group3)))
        
        let utf8ForCommonItem = Int(Array(badge.utf8)[0])
        var priority: Int
        
        if Character(badge).isUppercase {
            priority = utf8ForCommonItem - 38
        } else {
            priority = utf8ForCommonItem - 96
        }
        
        badgePrioritySum += priority
    }
    
    print (badgePrioritySum)
}

/*
 step 1: finding duplicate item
 split each line into half
 
    find count/2 character or index; i can easily find count
 
 find letter that exists in both??
 
 converting letter to priority
 UTF8 A = 41; a = 97
 priorityScore: a = 1; A = 27
 
 add to prioritySum
 
 
 let dogString = "Dog‼🐶"
 for codeUnit in dogString.utf8 {
     print("\(codeUnit) ", terminator: "")
 }
 print("")
 */

















let day3DemoInput = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

let day3PuzzleInput = """
BzRmmzZHzVBzgVQmZLPtqqffPqWqJmPLlL
hpvvTDcrCjhpcrvcGGhfLHMlLtMCqflNlWPJlJ
hGjhncHhGnhbTHczBBZVVSbRwgSgRV
rWVQjPQQjGRWNSrWrPjcptwBpqqJBtJBBcZgMdtq
zzmmpzfTCFpTlMlJJwBgMlqMBt
TvLszpbhhTLmsnRQPDQGWDWRvQSR
zGzvLlGlQHLGBQZlhBWhdjRdmdWRcjPj
fTJNfTfNSRWPhjdjfj
pbsbVVnpSnbVTprnbqqrzvLLgQlGLPLHll
ZCCCsWvNvmsCsCmZLZmgMLRpQMhwQRpQRfphfprpTfpM
tlncPjzlndctbzcPPBcjwDphwrfGGDffbDRpDTGG
cdqnddwzqjNVWVLZZLZq
DTLbDbRrlQbwhhNrmmfwdt
zzMJMzjCjJJjvLjMPJpcgPpzfhHdfqWcqddwtwfqdttcNtdN
pJCzVpCvDZBLsVRQ
STzBBbJzRRBZBRTqCCsfZLtNNLClCsfh
jsQnnQjjHcvQFrcPwCmtLCNlvDfftfff
sGFscMQQMMpqzqbMbd
QlNDWGsjQjgQllWQsbtzqTJczTJcbFmmFJJP
MhLrhgLVndRmzJFzVqqJqP
pSLnMdwhwdRZRSwhLZwLhdGWQjlsgWjNQWWSvgBsWDlj
THjSRFSddTjdBTcPLcVVvVBw
GzWnWfndWfznDfsnsBsPVwVwPPLL
zNflzJWqqzQDdSStHNZNpFFtbj
FSzDmsFSFlDlBzqVjqHHjHHpVgHLbp
rTrTtTQQntRQnQJQgggHZttVgHLBLhZL
WTJJRRQCRRJTRdBCRdvRNDFSWFMPmDlPPSsNPSzS
WQldlMtMVQgVMQHnDGbHGGnRnQmD
rqcZPrCFjmHlbGjZ
zSScchqwchBzTzFzhhSlcCwNtdVWWJgsVdMtWNgNVWTJTd
lMZqjMWllrTTspjprWWSSwgWNSVNDmWGVwFwgN
cdCCdLHcnndHJnmCRntLBnRzDvFNtNDVzgSgwDgFNVzFVv
BRLcCCJCmJdcRhfjPPZphrlrPqlZ
GdGqcrrZGDrvDJJqJHcBvmFFgmFMMgMgBtMLTssLmF
NbPVPDlljPmTmsTj
VfQDhflCCRWdcrQwJvvnJv
RLcWgLCqqPQLcqZwzHgwmmrmmtgwTw
DhbhNrMpnJSDJwVTHmmTVnTTVj
lrsvblMDlcWcfQPQ
PVldlphHwGwJJGdjZZWsRbbsGsNWrWQbNbQR
SqcDvTmDLtfmSmtqppfqzTgTQBrRQsbCFWbNNFQFBBrRbLNb
MgtmTgtfpqVlnVddZMwV
BdmfmPBPSbSNdGSdvWrwcZrccZPPcZnH
jzzLsjsMRlQQVHwswvvZrCHrrT
VqhzVFzplFlpLwpMphLRQQVRmSqgbdGtNJBmNSmgGbtggSgt
DHVpNZjdZjFZWVFHpvFvzmlRzPnlfznFRz
lrTBTsBwwMbrrwLPPfwGmGzvRf
scrtMhMCtJBBBclbHdHttWZWDSqDSjHj
wzqsPmqsbsfqBwPMNRMMZcZmFFNtZM
CgCnhlvvLJgcRFNNBdCpWM
QnQrVgHSvVHjbjTGBbbTHb
HdrVrdqFDdZVmHgRmDRFHMnTdTssMGnLnPJLbPTbCs
SczlScjwcNzplNzQSSfjwQSrTGGsbTsnTCnGTMCMLMGGbN
wQlfjrhfhQFHqZhRZRtD
RsfJDGJvzPNcjpddSWJWMd
LLCbBCwCrCmVVnrmhQFmbVhdcdlWpjZzSpMdWSpcWczSBj
rrLCbTwnHTvzvNGT
wPhPhbCqqSCrtJDlqvlrJr
RVVZddLFRZZcQLvJJtzptlgPJp
TVQRZGVncFdTGWZdCNShHhfPNwwsWPwb
dzLVzPSgrgDDDCMSMLLPwFmdTTcsvmwNwjNsHcFF
nWBGntQfGNGBflWBBqlpRQGbWFvjwsbsFswbvTHjjbmHTc
tBNJBnGBflQnDPJrPhDgrPVg
VtWztWtqpqzWpWzqjNRjNpWTmrrmrSbnmJwSJwnMPrCSJVwM
sDHsBDhBdsBZGcHvLHDLhhCSnRSwCJMZrPbmnMbJSCSR
ccLRhgsLBdRsdHNTFFNNgqTglqzF
hztlmDhPhgPlPNNgmZMCbmwwQjcwjjwMjVCd
RSJRrRqnqQJFqvnTGrHCcHHCCHHbHHMcMvdM
qGJsnQTRsStsftPlhPNl
BFFBLPRCwsLwhlPlRmhcGGrbmmGjfNTTnp
VJMVpzgqggJnrjmjNcMjmT
VqdSZtQgZvtdzqHqHtVZdVQpCDWWFdwlRPDpWPPBCswlWD
fCWCsjPzcbzwRSzVTzhhDLqvdg
TmJtrNJrBLSLJqgS
ptNTQFHrZlnpFPwsWMbRjCpcjR
nJmQNCmbmlllmbClbfMLjMFqbGBsdLFq
ZcgTWcTnMqqMTBqF
tPgctSnPctZZgDWzZgQHwNmHlhlmzlQhlJlw
ZpTCwpffdslvgShCBhqhRz
FDMPnNFNmBPzvRPRBg
nNgMrnnDGjDmJMmnFdZTTsdsrZrslcwcQr
pTmczpCldcdDDnPttpvWSqbpJf
jgjRZMGHhGLgQrjvPWzPJgJvzStbbq
LGNLLNBBzcDFCBwwFC
nJTTqnrNvTzNMzzNfqrTPrJnwpwPpZpsHccZVsBRpcVHwpcp
bgDhgbghLWmFmStctVpZtBCVCCpfZp
LLSgLGSjggFGbSSbmMnrvqvzjfzTNrJrqM
RRpDmmPMTjwfGmJQgQ
WsNscdnvvdVZFVnnrZbjjflwljlbzfGFjQjq
NnLZsNnrrVVVcvdBLTPCPCRMwhPMBMPhCt
lbVvzngGJnVbJHpHtHNPpdSQvc
TsMBswFZsWMWBZMNwPtNNtRNHcNpSQ
CcZCTrZDsjZTsTsshWhrWrTnfgbLDfJzVVLVVlgfnzfVGV
JzTTRtJRZWmWjrMHCT
DDFGlLGcGlSSSLsFGBspPBmNMBHMghmWNmWjWCmWtH
nSSpnbsGlLDnpPsSSspFtVvffRQdVzqvvbqdfVQwRz
sMhzszlHHDsWbthHDqsbJjpLNtmjVJmVLLVLVLBp
nrTPrGwfPLdprzJzdL
wgPQcTGGzgccwCgnRwgRChFhlWSDqWWQMWhssSsMQl
NSNmwtpSpCpvMphCsr
PHcRGPLJMrsvzsqG
QHjbnRMcfbPbQZmlZgZlgBBQ
cPRPbhQjbQRdtPQdLqLHqzFZjCFCqLjC
mmfsnnwrfvwrfSNZFzHHLDCFNlLlqDlN
wsmrwswwGTffMrBnmQttJtcMZQQtPJPbZc
MvBPDDRRdnnvHPCHZLHZsFLL
rmJcbVqbcjWwWjQHLzTZFTHSzFrpsz
cmwllVqqGJbVVVmmqbQcmgRnRvGhGfgDRDZBBBvRdd
nMvMhMnvhnbTZWSSZgHmGJDFmmNDzBmbNmdGBN
rCsPLRCssRjrLLsrLlwRVrcNJQfDQfdBmmfNBGJNzmDPfB
CRjCpLltgtJgJJWq
jshCzJpjzTPpmCWvSlpfwHfSWglf
LQMMNMnHtDtLVRvwwgRWlldgWD
qHVrQNHVMFQtrrBBQMBcrrZsZbzCZhbbJZJsmmsmFPTC
JZQZnsQNMqTngZqJBVfBfPPVBNrwvfPw
SSmDstFjpDpCszDjcLLhrPVlGlrGGVBwrvwVPt
FSssFcLjFjbmFFCzjLcFLRDnMJnTHRnZZTdWqZZWnMnRnZ
GbHRHpldwGMpWhHpCMBlCbRdVSLhnqJLSrDPLPPLPDqVDrhh
gvjWWQvgZFtQFFNqLnVnDnSJzzztDD
ZccccfTsffHdWWdRWwsw
ClCtbHMlnnPPlszV
gSDWSLgWQWQJJNWqgtQjPsnfcdVcLVdVdzfzVzff
WQgqtFQgDgQSFqJhqhSJvNDRrZMZHwHMCbZhTpZbGHMTMG
pZJZlCQtHFhPfdNfCh
zcmLSVczwcMcLDNFHdLPhPWH
szvVVnBmnTGQtHTQ
RVVCNDlNGzlGZqHGHWqWhGqQwH
ZFLFTmpLvvmSqsbb
TrfpBfJpJMlnnNfNZD
qHHlDClHhltMqQsHDhHslGznwdTnzzwDGSdfnwGnwG
mZRNcNcLLPNPBFFbbPmLmbZFSCVfJJTVndVfSwnRzznfTwCS
CcCWFbbBLCWtgWgHjghqvv
TjbzlnlFmfqCFFVVCRWr
PhMcLpPDtMLpwPDvLPJbMhSgVCGqggVqQgCqCgCgSWvv
btbZbNZhJDJJhDtwtsTTTmBzzBBmlNlmHj
FqhjWtqlqmmsnFPTCvMCQMTTCjQd
pfffRfLpgrgGgzrNVzzpGVzRCdMCPJbwwcVMbQPCJVMVdbww
DGGDZRGrHggzSsFQnnWShmtH
vtHVVMMrvVMVrSHvLgvlHcZFCnRCZcccZtRRZfJFCJ
rdDjGsdTQDcNZfdncCRR
rBDsTwBbjbmbbQswswPhqVmmSvpVhlvvqMhHhh
vGBLrqMNvqSLBvvrNbllLHfwStWWtFttccjtRtjtcj
MhCDJmhMDzmcRRcjzWfztH
ZQDmDhVVCQbBVdVNMvvv
ptCtCzhWPWptnhVzzpGZbZTjTjVjFGjVFgVl
fQswRRffmRqZlgrqqFjjSgGg
HwsQDNNsDsmRLLHmffsfvHptBnhtzCvhWpZWBdhnMdCh
RlHzzTqczBPfbnvcpB
wVtNwpSZstppwwMsZhsdnLvnbtBBmbnLFFdnmF
WNQJMVWsZWwGJWhhSNrQzlgHrDCgQRHpCHrl
RrZWpJZRrZpdTGstlchLGGlLMd
NqjDPCQPnQCSvtMzSLhhjM
nQVQDDDDfwBwNCVCNVFNpWpgJgrRTmLTmTmgRTWF
SHMcrMHpcjGcjSrMMbvSvvSvwFTLJwJNtFGFWJNtDLFTLfWN
zqRnPfzQCRzqsmRPzznhszzLtLwQwwFTgWWLDLgWFTwTNQ
qVPZmRZhsCZPhZlRCqRRRCbfpccMBjvMVjdHjjMjSvdf
VVQdHwBZLVltlddtBczhrzvGcWWFRwgsFG
TDTTTqqTSSqjqnmTmPqPPmTmGhRszvsrzsjRsccgzrRzgWGF
DpJPqpWqHbZpllpt
cCSCFsnnZFnscDtNdJFJtJtdmb
VgBqBsqRrHtNdzmNrt
BGLLVVjRBsqPBfsGwPsMfSSZCSfTZTZQpSphfS
plCHCHlgglHHGpNbtngNrDvBDpfQDBQfZDfWZVrr
mTmMLhRfwhsLPQvQZDMZQBQWMB
cwsssmqRTFFfFgtbCtGl
LQPPrCPnMZwqtRMn
cWTSlJWlcplJdDTdGdpDlGcGgqmtwwZtqRrNRRmRdNZqmgNq
GSJcJSjsjTpsvWGWBHLLvVVBBBrFrzVz
NVPCSPMNDSNFVSWCsJJJmpGmZZGLLcpZLHGGtsHt
fwzlBBqghqvzqqlDrHbpHjZHmGZbLZrHLb
dnBgnDqQvwRnSnnFMFMP
BCbPsFFwCRHmDSBmWnvDDj
phhZVzdpVfQZphhZpRhSVnjmrcvvnrWtDrvWDS
TfQJMfLphMhJdfdzpQJRTPbwHHNlgbGwsTGgCP
ttWLlnnvnNnBBtlTqWlpvpndQdZsQQFssFDdsRFdVdRNFQ
jSgrScrbGZSGrrCGsFVMssFsPPFcDDMV
bzSmJbfCZCbzLwllflwqtvvw
zmFTJwFLPmzLztmjDzTJwfNrdFNrFppBSNRGNGdbrpBR
gqlhWQgsZMsvqMlMMvsvqsNlLbcdppbrRpdbbcSrrbbr
vssCgVgCsggZQZCgsnsqWgWvfJPDLwffwTPPmzTnjTPmPmwJ
SpcRTPQLBLWpNNzjmmwwwRrR
tGlfvGhfnbDlbqlChnfFMrwsmwNssTMHMHjFwv
ZlhtCtffCdWcZWZVVT
jTTCcWHWJNgCGTzTmnzrmnGn
BwRRbFvtvvQmJJFMpMJr
ZBBwLvqbBZsRsbVsZSqbcZdJjHHjhfPCJfJfHhgc
VrnDSvvrLrfTdTLGfdRp
zcJzmcFcHGfdGmWTVd
tHsMhwPVctccHFHFcbSDbbPjnNbBnbvBQB
QttWQwLTnLnWTtnffnLQSBFVjNvBjBFNgMdCsVWsjv
pDqcmmRPHqgVBddjvN
DcclzbcbPbJLnNTfnw
plRcpsZDGlGZvWvMCNcLtttq
SrfrwSjSVrSjwbmSrHzmHJCQQPQzqttNNQJMzJtqMW
wSHVnfHfWwwHWFVfSnfgmmRsslFZZDBBGZsZsDTdGRTp
qSFQSgQNgQBrBHHcrW
VTmjVJLTwlTmwTVmsMJMVlJmPvcbvvbCBbGBPjGvBbBGWcbb
DnJTZwmnZRhnpqNdWt
dTVHjZLLZDVCfVHtLDDjQbscjWbSJMJPjsbWWb
FnqrnmzzFllmsWwtsFtQMMFc
lmqzzzngGmlNNBqGllzlBNRvptHHpTCHpDLpgDZdgvHvDD
sdRZQbCfZTSTdlfTZCffccWPHPPcPPwLwctRnLWn
BBJDzFVgCDrCJrqDJJhqJVVMLPHwcctFwcWHHGLcwGwGHnWc
ghpJgqqjCZbQdZpd
tbcpzbHSszcHBgqHGZgJJJhhww
jfvdvRTffQQrrFCRFTnGwJRqNRZVpJGZLZggLh
nQTjTnMndlTdQFMvnrClCnpzmzDtbbmBbcPSzzlmmtzP
BqBqTCSTcqHsJHHM
WWPGVPLtzVgWtjWPGzVjzVGcbDhPsRbDcsbJwNRswRDRss
VQfWjfLFGWLjdFfVzTZZpJTpnmlTrSQlBl
jLNsZjqSHCsGdsmpsm
MvnVFzWMwMVWzfnVDwfBMfnnrCtdtPmPlRrdrJCJrtPDrrPD
zznfFWwMfMfFMwVTMQFnQjhjgjSZhCNbLSTcHHgbbC
GGtssttVmvnnGNMQrrVzgwVrCWMz
FdhfhhcCDhHLfzclZMcrwcQMZM
HHqqCBhHSSpdmjGqmGjtjtjj
bbQLtGMQQtQRQtrDtGprrrbCqwplZhhqSqmdwvdzqqqhSmpS
FsJjJBfnsJcFcFfjVPjWBzldqhqnlZZZzzhmnSvSnm
JPcFfFWjFHJVVsVjPVscsDlLNRHGDbLRMRCDNrCGbG
JdMdlMRJnTwdvcjv
CDLHbNSzzLFgHvnTjrswBNBTNT
QgbvzSFQmZQPQQRW
NTBrNzrpjjjCwGbB
FRbQlcvFvcRQQlRsMlRRRZjwCqMwjmjwJZdLJmjCZC
cVPPQcvlWDNhrbPz
VdbVtbbZJdtJVVdDVZmTLqqTSQvNLjjDShhvSG
zplpnBnFpnrrlghGNpLNqHvqvjNj
cWncllnlPFWzcMwtWWtsVLVRmJWCds
ShLSTnZnTSttTSbLQdfSZTMwcDHwwcHnJvDHnlnlclMM
NmPMsssRrVwjDclHJwwR
gNNMWGzNmqGdtfZTbGGb
sWNNlRHnmJtmntJt
brbbBTbbFbCbqqGgBTrCfmQVVZfSSQQSVtJZSrVZ
bbFqvbDvvGGLGbCCtBGDLbLlcPNHhhccPNcdPPchlsdR
DCFvDvnCnNfMBmMMslDZML
SQQQJHwpSgJSJHQWSWHqJWWbmcBBBLLTsmhhTcZbMhmlshcb
RJRgpJHssgwSQHRqsQPGGjjtNCrrFvvnFjjPrP
mThmsgjzTPjMpcvtWP
GNNBVqVGNZbbNbNqqZQVNVNbWcpdtMCcpCtMWCdCPpQccmpp
VSmNrmmbBfZVlsrssrLTRhRhTn
TdmCvLDCpTRNTdFbbWnnSWCfhjbbzn
GrrMsPVGcQHBGMbhjjSgWfHHDbjb
BPBVqqrQPsQqwrrmmmJdRLDDqFRplT
fpDDJljDlCfDTjprjrfbddWthCSCtdPPQFhSSSWW
HsLZgMGbgBBsNzMvGbdVtVQzFRQSthhFPdtP
sMBmGBmbNvLHGMnrDppTcJmcjpqljf
ptSpSJQqpbNGGDDhcMWrlNHcZZWWls
zRLRRRjvvgjHMMsMpWpc
vmCPLCgwvwdnCzmvLbpTbVQqJJPbJPpTVq
TJCfhhJVFffrJJQQllNWcvWhwvWD
GPSGjjpLslBbpLpLqqqPDvdwvwvNzQWGzDDNdzGN
msbRjbpPqsRpHnlZrmJlnVHT
GGfFsCCTvGDsfTTrhsCMMzptZJMdpdgtrpdMcV
LBlwBHPSqjwwlVggHpnMZcVHMt
ZlZZlBbRPGGTGfmRsD
CtCjbVvzQQZTWVdd
MlSqWlmsmGBSHJHTDFHZ
pcqsmsplwsqclwRtRWgtRnPPvb
zCrzCrsdjrhGDCFqGDjRRPtpWfQQcpfQZcCZPp
VSVwVMgLHHLTwMDTMMVnbWPRZQRcRQPptWnpbZcb
MNBBBlSMvLVwTlVTFdNdhNhFsqsGDrzm
rBLWTwTThWwVVDTwHBsZZWppvpGtpptppmRvFFFMFMfL
qPPNCCbqcbcNqbqQjjJQqzjRpptmlpMGmMlJtftmtFHpMt
QnCgzzQbbQqPcPQnncbdQdnVTwDssZgrShBTVgZZsBSDHT
PFGJFqnfqmPgFJQPWdbLdpDRhbphWjDm
rclNHvcrzCNwrWRprjdMMMph
wsZHwZNvRRQsQqBV
LqlGCPlPLTCPqqQlpqLlWfBfWgcHNRJRfWNsncGH
VVtdwVtDDdVmhrdwSBmjbdzNHgfgJnNnsSnHsNffHgRsgR
wVzhbjmDbDrwjdbztFDDthMCvqPppZQBQLZQTqTvFTvZ
BnQnQFwRmRwmwdBSFDFnmSDVLCJTCTppVVmGLVTCLcgVpC
ZlWvhvZjNrbNvqjNhlfPfqjCGHrsspggTpVLpsJCpcJVgg
vPzNvqjWhqFzGSnRGMDG
wZnMZzzZZchDRtVsqtCtwV
WmWpWWmPPWrmrmBmWrTlTFPNVqVCRSDCQHcqVTtTqsSDSTSD
PrppdFlWWlfrWmpWFffrdcGjJJGggnnhZGdLLgGGndvz
FShHNmNhRhNJmBnQBQJrmP
VTgzDTjwfffwzDvwlcczzVSJbQlBQSWBWCnPJPbJWWbC
tzSVtzvSvGSRZqqFMNtpRR
hPZhGDZpnCGtDhznjmLmdJffdNzJ
glwsSrQwBvLdgLzdcj
QsRbHllzzlHwHlBszWlTBFbpDPMhbPDVGpGFpPtFPp
SRjStRDctgDSBzLvPvNrDhmPLr
QqTHGTPJmmHmhNmH
TGQZsTqFnQZCJTPsnJnZQMjVRBVtcVRSVRBlwccSCtBS
bbsNsvsvnNPTRRllbblLqhtQCqQSLCGGHSqHNC
wFpzFgqVzqVJWFDwqJDmSBBmHBHhShLQhCGSBCGH
MJVpFMqgwMqRRbZsMbZMrP
PPdDhvNDQdmgQPZmQVHHtHGGWVGbffWGvs
MMLCTRRLlLclTLRMRLCwMLHWVctbVVHWWWFfVjVGsFWW
MRSMMlpTJRqClBCRqBDnzqgQPnqgznZPZqbP
MrMNPNNpjvdprWtrpMsthqBfqlnfqcGhVBqFRcnqFG
QbDgSSQbgSDDmDVmlqSCRllRcFqnqfBl
QVJbVmwwDQbzVTgbppNJNMWNjNNPrdpM
WwJJNbtHfpLpVgZZPVFhZh
vmmqlDvRvRfqBSrlzmmMjRBhcVhQVZhVghCQQQQTcTrPTP
jSqMmqRzMDDjvqlBqsBMBmmwGNJwJnwLNfbGwddswnJtJH
RLgRmRggbvbzzPmmRNmzsQWFtSGNtwSNQnntFwnnCw
pDBrBHpHhlldphHBHhJVFSLnWWFJttCtQSttSS
hfHrpphHBppfTvmzgMmbLbgf
"""
