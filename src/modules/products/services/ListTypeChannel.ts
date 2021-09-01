import { getCustomRepository } from 'typeorm';
import ChannelType from '../typeorm/entities/ChannelType';
import { ChannelTypeRepository } from '../typeorm/repositories/ChannelTypeRepository';

class ListTypeChannelService {
  public async execute(): Promise<ChannelType[]> {
    const channelTypeRepository = getCustomRepository(ChannelTypeRepository);

    const channelType = await channelTypeRepository.find({
      select: ['uuid', 'name'],
    });

    return channelType;
  }
}

export default ListTypeChannelService;
