//
//  CRC-16_CCITT-FALSE.c
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

#include "CRC-16_CCITT-FALSE.h"

// Code From https://gist.github.com/tijnkooijmans/10981093
uint16_t crc16(const char* pData, int length)
{
    printf("DEBUG C INPUT: %s %d\n",pData, length);
    uint8_t i;
    uint16_t wCrc = 0xffff;
    while (length--) {
        wCrc ^= *(unsigned char *)pData++ << 8;
        for (i=0; i < 8; i++)
            wCrc = wCrc & 0x8000 ? (wCrc << 1) ^ 0x1021 : wCrc << 1;
    }
    return wCrc & 0xffff;
}
