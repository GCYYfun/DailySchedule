# Zircon Syscall


## 内核对象划分

| syscall type | count |
|------|----|
| Handles |   4  |
| Objects |  10  |
| Threads |  5  |
| Processes |  5  |
| Jobs |  3  |
| Tasks |  3 |
| Profiles |  1  |
| Exceptions |  2  |
| Channels |  6  |
| Sockets |  4  |
| Stream |  6  |
| Fifos |  3  |
| Events and Event Pairs |  3  |
| Ports |  4  |
| Futexes |  3  |
| Virtual Memory Objects (VMOs) |  10  |
| Virtual Memory Address Regions (VMARs) |  6  |
| Userspace Pagers |  5  |
| Cryptographically Secure RNG |  2  |
| Time |  7  |
| Timers |  3  |
| Hypervisor guests |  2  |
| Virtual CPUs |  6  |
| Global system information |  5  |
| Debug Logging |  6  |
| Multi-function |  2  |
| System |  3  |
| DDK |  14  |
| Display drivers |  2  |
| Tracing |  4  |
| Others/Work in progress |  14  |

共31个Object syscall 

total = 4 + 10 + 5 + 5 + 3 + 4 + 1 + 2 + 6 + 4 + 6 + 3 + 3 + 4 + 3 + 10 + 6 + 5 + 2 + 7 + 3 + 2 + 6 + 5 + 6 + 2 + 3 + 14 + 2 + 4 + 14 = 154

## Syscall

### Handles

|id| zircon syscall   |description| zcore |
|--|------|----|--|
|1| handle_close |    |
|2| handle_close_many |    |
|3| handle_duplicate |    |
|4| handle_replace |    |

### Objects
|id| zircon syscall   | zcore |
|--|------|----|
|5| object_get_child |    |
|6| object_get_info |    |
|7| object_get_property |    |
|8| object_set_profile |    |
|9| object_set_property |    |
|10| object_signal |    |
|11| object_signal_peer |    |
|12| object_wait_many |    |
|13| handle_close_many |    |
|14| object_wait_one |    |
|15| object_wait_async |    |
|16| handle_close_many |    |
|17| handle_close_many |    |
|18| handle_close_many |    |
|19| handle_close_many |    |
|20| handle_close_many |    |
|21| handle_close_many |    |
|22| handle_close_many |    |
|23| handle_close_many |    |
|24| handle_close_many |    |
|25| handle_close_many |    |
|26| handle_close_many |    |
|27| handle_close_many |    |
|28| handle_close_many |    |
|29| handle_close_many |    |
|30| handle_close_many |    |
|31| handle_close_many |    |
|32| handle_close_many |    |
|33| handle_close_many |    |
|34| handle_close_many |    |
|35| handle_close_many |    |
|36| handle_close_many |    |
|37| handle_close_many |    |
|38| handle_close_many |    |
|39| handle_close_many |    |
|40| handle_close_many |    |
|41| handle_close_many |    |
|42| handle_close_many |    |
|43| handle_close_many |    |
|44| handle_close_many |    |
|45| handle_close_many |    |
|46| handle_close_many |    |
|47| handle_close_many |    |
|48| handle_close_many |    |
|49| handle_close_many |    |
|50| handle_close_many |    |
|51| handle_close_many |    |
|52| handle_close_many |    |
|53| handle_close_many |    |
|54| handle_close_many |    |
|55| handle_close_many |    |
|56| handle_close_many |    |
|57| handle_close_many |    |
|58| handle_close_many |    |
|59| handle_close_many |    |
|60| handle_close_many |    |
|61| handle_close_many |    |
|62| handle_close_many |    |
|63| handle_close_many |    |
|64| handle_close_many |    |
|65| handle_close_many |    |
|66| handle_close_many |    |
|67| handle_close_many |    |
|68| handle_close_many |    |
|69| handle_close_many |    |
|70| handle_close_many |    |
|71| handle_close_many |    |
|72| handle_close_many |    |
|73| handle_close_many |    |
|74| handle_close_many |    |
|75| handle_close_many |    |
|76| handle_close_many |    |
|77| handle_close_many |    |
|78| handle_close_many |    |
|79| handle_close_many |    |
|80| handle_close_many |    |
|81| handle_close_many |    |
|82| handle_close_many |    |
|83| handle_close_many |    |
|84| handle_close_many |    |
|85| handle_close_many |    |
|86| handle_close_many |    |
|87| handle_close_many |    |
|88| handle_close_many |    |
|89| handle_close_many |    |
|90| handle_close_many |    |
|91| handle_close_many |    |
|92| handle_close_many |    |
|93| handle_close_many |    |
|94| handle_close_many |    |
|95| handle_close_many |    |
|96| handle_close_many |    |
|97| handle_close_many |    |
|98| handle_close_many |    |
|99| handle_close_many |    |
|100| handle_close_many |    |
|101| handle_close_many |    |
|102| handle_close_many |    |
|103| handle_close_many |    |
|104| handle_close_many |    |
|105| handle_close_many |    |
|106| handle_close_many |    |
|107| handle_close_many |    |
|108| handle_close_many |    |
|109| handle_close_many |    |
|110| handle_close_many |    |
|111| handle_close_many |    |
|112| handle_close_many |    |
|113| handle_close_many |    |
|114| handle_close_many |    |
|115| handle_close_many |    |
|116| handle_close_many |    |
|117| handle_close_many |    |
|118| handle_close_many |    |
|119| handle_close_many |    |
|120| handle_close_many |    |
|121| handle_close_many |    |
|122| handle_close_many |    |
|123| handle_close_many |    |
|124| handle_close_many |    |
|125| handle_close_many |    |
|126| handle_close_many |    |
|127| handle_close_many |    |
|128| handle_close_many |    |
|129| handle_close_many |    |
|130| handle_close_many |    |
|131| handle_close_many |    |
|132| handle_close_many |    |
|133| handle_close_many |    |
|134| handle_close_many |    |
|135| handle_close_many |    |
|136| handle_close_many |    |
|137| handle_close_many |    |
|138| handle_close_many |    |
|139| handle_close_many |    |
|140| handle_close_many |    |
|141| handle_close_many |    |
|142| handle_close_many |    |
|143| handle_close_many |    |
|144| handle_close_many |    |
|145| handle_close_many |    |
|146| handle_close_many |    |
|147| handle_close_many |    |
|148| handle_close_many |    |
|149| handle_close_many |    |
|150| handle_close_many |    |
|151| handle_close_many |    |
|152| handle_close_many |    |
|153| handle_close_many |    |
|154| handle_close_many |    |