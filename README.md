<p align="center">
  <strong><a href="#quickstart">Quick Start</a> | <a href="#documentation">Documentation</a> </strong>
  <p align="center">
    <a href="http://urn.kb.se/resolve?urn=urn:nbn:se:bth-21849">
      <img src="https://flat.badgen.net/badge/urn/urn:nbn:se:bth-21849" alt="URN" />
    </a>
    <a href="http://urn.kb.se/resolve?urn=urn:nbn:se:bth-21849">
      <img src="https://flat.badgen.net/badge/DiVA/diva2:1574260" alt="DiVA ID" />
    </a>
  </p>
</p>

# The Performance of Post-Quantum Key Encapsulation Mechanisms
## A study on Consumer, Cloud and Mainframe Hardware

**Background.** People use the Internet for communication, work, online banking and more. Public-key cryptography enables this use to be secure by providing confidentiality and trust online. Though these algorithms may be secure from attacks from classical computers, future quantum computers may break them using Shor’s algorithm. Post-quantum algorithms are therefore being developed to mitigate this issue. The National Institute of Standards and Technology (NIST) has started a standardization process for these algorithms.<br />
**Objectives.** In this work, we analyze what specialized features applicable for post-quantum algorithms are available in the mainframe architecture IBM Z. Furthermore, we study the performance of these algorithms on various hardware in order to understand what techniques may increase their performance.<br />
**Methods.** We apply a literature study to identify the performance characteristics of post-quantum algorithms as well as what features of IBM Z may accommodate and accelerate these. We further apply an experimental study to analyze the practical performance of the two prominent finalists NTRU and Classic McEliece on consumer, cloud and mainframe hardware.<br />
**Results.** IBM Z was found to be able to accelerate several key symmetric primitives such as SHA-3 and AES via the Central Processor Assist for Cryptographic Functions (CPACF). Though the available Hardware Security Modules (HSMs) did not support any of the studied algorithms, they were found to be able to accelerate them via a Field-Programmable Gate Array (FPGA). Based on our experimental study, we found that computers with support for the Advanced Vector Extensions (AVX) were able to significantly accelerate the execution of post-quantum algorithms. Lastly, we identified that vector extensions, Application-Specific Integrated Circuits (ASICs) and FPGAs are key techniques for accelerating these algorithms.<br />
**Conclusions.** When considering the readiness of hardware for the transition to post-quantum algorithms, we find that the proposed algorithms do not perform nearly as well as classical algorithms. Though the algorithms are likely to improve until the post-quantum transition occurs, improved hardware support via faster vector instructions, increased cache sizes and the addition of polynomial instructions may significantly help reduce the impact of the transition.<br /><br />
**Keywords:** Public-Key Cryptography, Benchmark, x86, IBM Z, z15

<a id="quickstart"></a>
## Quick Start

This project holds the full source to our thesis.

It was written on Overleaf and it is therefore likely easiest to zip this project and upload it to Overleaf for continued work. To read the submitted versions, refer to [the releases on GitHub](https://github.com/profiling-pqc-kem-thesis/paper/releases).

Any data used is present in the https://github.com/profiling-pqc-kem-thesis/data repository.

## Table of contents

[Quickstart](#quickstart)<br/>
[Documention](#documentation)<br />

<a id="documentation"></a>
## Documentation

### Building

To build, first clone the repository and create a zip of its contents.

```sh
git clone https://github.com/profiling-pqc-kem-thesis/paper.git
zip paper
```

Then head over to Overleaf, create a new project and upload the zip file.
